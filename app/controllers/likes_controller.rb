class LikesController < ApplicationController

  before_action :authorized
  before_action :find_like, only: [:show, :edit, :update, :destroy]

  def show
  end

#edit will add instances of steps, not likes (not edit like)
#see edit in goals controller
  def edit
  end

#update creates a step, not a like
  def update
    @like.assign_attributes(like_params(steps_attributes: [:name, :description, :start_time, :end_time, :location]))
    if @like.valid?
      @like.save
      redirect_to step_path(@like.steps.last)
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
