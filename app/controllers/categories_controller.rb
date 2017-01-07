class CategoriesController < ApplicationController

  skip_before_action :require_login

  def show  
    @categories = Category.where_by_param(params[:category_name])
    @head_title = " | #{@categories.first.title}"
  end
end