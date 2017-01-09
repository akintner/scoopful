class Api::V1::ItemsController < ApplicationController

  skip_before_action :require_login

  def index
    render json: Item.all
  end

  def most_popular
    render json: ItemAnalytics.most_popular
  end

end