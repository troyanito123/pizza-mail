class UsersController < ApplicationController

  include UsersHelper

  skip_before_action :logged_user
  before_action :user_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = I18n.t 'user.create'
      redirect_to login_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)
  end
end
