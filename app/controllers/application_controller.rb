class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart
  before_action :set_head_title

  helper_method :current_user
  
  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def set_head_title
    @head_title = ''
  end

  def login_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
