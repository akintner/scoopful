class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order('updated_at DESC')
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    order = current_user.orders.create
    order.checkout(@cart.contents)
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end
end