class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order('updated_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    redirect_to dashboard_path unless verified_user?
  end

  def create
    order = current_user.orders.create
    order.checkout(@cart.contents)
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def verified_user?
    @order.user_id == current_user.id || current_admin?
  end
end