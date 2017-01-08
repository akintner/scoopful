class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end
end
