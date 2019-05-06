class ApplicationController < ActionController::Base

  helper_method :get_current_user

  def get_current_user
    # memoization
    if @current_user
      return @current_user
    else
      @current_user = User.find(session[:user_id])
    end
  end
end
