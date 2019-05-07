class HomeController < ApplicationController
  def home
    if get_current_user
      @user = get_current_user
    else
      redirect_to '/login'
    end
  end
end
