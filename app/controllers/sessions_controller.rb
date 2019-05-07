class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:username].downcase)
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash["notice"] = "Sorry, that user was not found"
      render :new
    end
  end


  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  # private
  #
  # def find_user
  #   @user = User.find(params(:user_id))
  # end
end
