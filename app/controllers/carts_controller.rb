class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.name)}."
    redirect_back(fallback_location: items_path)
  end

  def index
    @head_title = " | Your Cart"
    @items = @cart.items
  end
end