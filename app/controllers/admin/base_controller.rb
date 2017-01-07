class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def dashboard
    @orders = Order.by_status(params[:status])
    @statuses = Order.statuses.keys
    @header = params[:status].capitalize if params[:status]
    render 'admin/dashboard'
  end
end