class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  skip_before_action :require_login

  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:success] = "You now have 
    #{pluralize(@cart.count_of(item.id), "pound")} of 
    #{item.name} in your #{view_context.link_to "cart", cart_path}."
    
    redirect_back(fallback_location: items_path)
  end

  def index
    @head_title = ' | Your Cart'
    @items      = @cart.items
  end

  def update
    @cart.update_item(params)
    session[:cart] = @cart.contents

    redirect_to cart_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove(item.id)

    flash[:success] = "Successfully removed
    #{view_context.link_to(item.name, item_path(item))}
    from your cart."

    redirect_to cart_path
  end

end
