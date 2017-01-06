class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find_by(params[:id])
  end
end
