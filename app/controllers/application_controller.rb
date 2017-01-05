class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart
  before_action :set_head_title

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def set_head_title
    @head_title = ''
  end
end
