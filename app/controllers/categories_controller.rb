class CategoriesController < ApplicationController

  def show  
    @categories = Category.where_by_param(params[:category_name])
  end

end