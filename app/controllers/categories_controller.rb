class CategoriesController < ApplicationController

  def show  
    @category = Category.where_by_param(params[:category_name])
  end

end