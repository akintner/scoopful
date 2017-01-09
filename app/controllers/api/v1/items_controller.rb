class Api::V1::ItemsController < ApplicationController

  skip_before_action :require_login

  def index
    render json: Item.all
  end

end