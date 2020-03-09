module SessionsHelper

  def save_user(id)
    session[:user_id] = id
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find(user_id)
    end
  end

  def remove_user
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

end
