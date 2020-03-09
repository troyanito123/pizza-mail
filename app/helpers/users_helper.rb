module UsersHelper

  def user_login
    unless current_user.nil?
      flash[:warning] = I18n.t 'session.is_logging'
      redirect_to pizza_path
    end
  end

end
