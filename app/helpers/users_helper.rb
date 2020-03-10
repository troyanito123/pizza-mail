module UsersHelper

  def user_login
    unless current_user.nil?
      flash[:warning] = I18n.t 'session.is_logging'
      redirect_to new_pizza_path
    end
  end

end
