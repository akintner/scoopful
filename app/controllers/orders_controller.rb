class OrdersController < ApplicationController
  def index
    @order = Order.find(params[:id])
    render file: 'public/404', layout: false unless current_user && current_user == @order.user
  end
end
