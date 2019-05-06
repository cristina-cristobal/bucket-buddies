class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:username, :email))


    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    @user.assign_attributes(user_params(:first_name, :last_name, :bio))
    if @user.valid?
      @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
