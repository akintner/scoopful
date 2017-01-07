class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user)
      redirect_to dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end