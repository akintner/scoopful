class Admin::ItemsController < Admin::BaseController
  before_action :require_admin

  def index
    @items = Item.all
  end
end
