class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:success] = "You now have #{pluralize(@cart.count_of(item.id), "pound")} of #{item.name}."
    redirect_back(fallback_location: items_path)
  end

  def index
    @head_title = ' | Your Cart'
    @items = @cart.items
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove(item.id)

    flash[:success] = "Successfully removed
    #{view_context.link_to(item.name, "#{items_path}##{item.name}")}
    from your cart."

    redirect_to cart_path
  end
end
