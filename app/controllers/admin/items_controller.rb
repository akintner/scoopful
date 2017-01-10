class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: [:edit, :update]
  before_action :set_statuses, only: [:edit, :update]

  def index
    @head_title = ' | Admin Items'
    @items      = Item.all
  end

  def edit
    @head_title = ' | Edit Item'
  end

  def update
    if @item.update(item_params)
      flash[:success] = 'Item Updated!'
      redirect_to admin_items_path
    else
      flash.now[:danger] = @item.errors.full_messages.join('. ')
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_statuses
    @statuses = Item.statuses
  end
end
