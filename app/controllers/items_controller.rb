class ItemsController < ApplicationController

  def index
    @head_title = ' | All Items'
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def reject
    item = Item.find(params[:item_id])
    flash[:danger] = "Item has been retired"
    redirect_to item_path(item)
  end

end
