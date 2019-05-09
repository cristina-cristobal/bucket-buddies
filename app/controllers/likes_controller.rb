class LikesController < ApplicationController

  before_action :authorized
  before_action :find_like, only: [:show, :edit, :update, :destroy]

  def new
    @like = Like.new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @like = Like.new(like_params(:goal_id, :decription, :timeline, :user_id))
    if @like.valid?
      @like.save
      redirect_to @like
    else
      render :new
    end
  end

  def show
  end

  def edit
    @goal = @like.goal
  end

  def update
    @like.assign_attributes(like_params(:description, :timeline))
    if @like.valid?
      @like.save
      redirect_to @like
    else
      render :edit
    end
  end

  def destroy
    @like.destroy
    redirect_to user_path(get_current_user)
  end

  private

  def find_like
    @like = Like.find(params[:id])
  end

  def like_params(*args)
    params.require(:like).permit(*args)
  end

end
