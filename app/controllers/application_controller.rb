class ApplicationController < ActionController::Base

  helper_method :get_current_user

  def get_current_user
    if @current_user
      return @current_user
    else
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!get_current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

end
