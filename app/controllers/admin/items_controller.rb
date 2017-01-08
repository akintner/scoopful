class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def edit
    @statuses = Item.statuses
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:success] = 'Item Updated!'
      redirect_to admin_items_path
    else
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status, :image)
  end
end
