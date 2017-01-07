class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else 
      flash[:error] = 'You must be logged in to view your orders.'
      redirect_to login_path
    end
  end

  def show
    @order = current_user.orders.find_by(params[:id])
  end
end
