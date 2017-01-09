class ItemsController < ApplicationController

  skip_before_action :require_login

  def index
    @head_title = ' | All Items'
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def reject
    item = Item.find(params[:item_id])
    flash[:danger] = "#{item.name} has been retired"
    redirect_to item_path(item)
  end
end
