class OrdersController < ApplicationController

  before_action :require_admin, only: [:update]

  def index
    @orders     = current_user.sorted_orders
    @head_title = ' | Orders'
  end

  def show
    @order      = Order.find(params[:id])
    @head_title = " | #{@order.id}"

    redirect_to dashboard_path unless @order.verified_user?(current_user)
  end

  def create
    order = current_user.orders.create
    order.checkout(@cart.contents)
    session.delete(:cart) 

    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])
    order.update(status: params[:status].to_i)

    flash[:success] = "Order #{order.id} updated to #{order.status}"
    redirect_to admin_dashboard_path
  end
end