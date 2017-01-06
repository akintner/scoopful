class ItemsController < ApplicationController

  def index
    @head_title = ' | All Items'
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

end
