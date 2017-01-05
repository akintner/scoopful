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
    @items = @cart.items
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove(item.id)

    flash[:success] = "Successfully removed #{link_to item.name, items_path} from your cart."
    redirect_to cart_path
  end
end