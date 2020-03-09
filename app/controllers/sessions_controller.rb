class SessionsController < ApplicationController

  include UsersHelper

  skip_before_action :logged_user
  before_action :user_login, except: :delete

  def new
  end

  def create
    @user = User.find_by(email: session_params['email'])
    if @user && @user.authenticate(session_params['password'])
      save_user(@user.id)
      redirect_to pizza_path
    else
      flash[:danger] = I18n.t 'session.error.login'
      redirect_to root_path
    end
  end

  def delete
    remove_user
    redirect_to login_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
