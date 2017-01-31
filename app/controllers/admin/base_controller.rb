class Admin::BaseController < ApplicationController
  before_action :require_admin

  def dashboard
    @head_title = ' | Dashboard'
    @orders     = Order.by_status(params[:status])
    @statuses   = Order.statuses.keys
    @header     = params[:status].capitalize if params[:status]

    render 'admin/dashboard'
  end
end