class SessionsController < ApplicationController

  def new

  end

  def create

    @user = User.find_by(username: params[:username].downcase)
    if @user && @user.authenticate(params[:password])
      flash["notice"].clear
      session[:user_id] = @user.id
      redirect_to @user
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
