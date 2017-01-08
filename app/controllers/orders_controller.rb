class OrdersController < ApplicationController

  before_action :require_admin, only: [:update]

  def index
    @orders = current_user.orders.order('updated_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    redirect_to dashboard_path unless @order.verified_user?(current_user)
  end

  def create
    order = current_user.orders.create
    order.checkout(@cart.contents)
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])
    order.update(status: params[:status].to_i)
    flash[:success] = "Order #{order.id} successfully updated"
    redirect_to admin_dashboard_path
  end
end