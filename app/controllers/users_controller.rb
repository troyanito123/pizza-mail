class UsersController < ApplicationController

  include UsersHelper

  skip_before_action :logged_user
  before_action :user_login

  def new
    user
  end

  def create
    if user.save
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

  # Helper method
  def user
    @user ||=
        case action_name
        when "new"
          User.new
        when "create"
          User.new(user_params)
        else
          User.find(params[:id])
        end
  end
end
