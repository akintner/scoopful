class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @user       = User.new
    @head_title = ' | Create Account'
    @submit_button_verb = 'Submit'
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
    redirect_to admin_dashboard_path if current_admin?
    
    @orders     = current_user.orders
    @head_title = ' | Dashboard'
  end

  def edit
    if current_user.verified?(params[:id])
      @head_title = ' | Edit Profile'
      @user = current_user
      @submit_button_verb = 'Update'
    else
      flash[:error] = 'You cannot modify another user\'s profile.'
      flash.keep(:error) if current_admin?
      redirect_to dashboard_path
    end
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Profile Updated!'
      flash.keep(:success) if current_admin?
      redirect_to dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end