class ItemsController < ApplicationController

  def index
    @head_title = " | All Items"
    @categories = Category.all
  end
  
end
