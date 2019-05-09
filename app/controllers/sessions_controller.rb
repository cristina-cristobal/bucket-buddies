class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(username: params[:username].downcase)
    if @user && @user.authenticate(params[:password])
      flash["notice"].clear if flash["notice"]
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash["notice"] = "Incorrect username or password!"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
