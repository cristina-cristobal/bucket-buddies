class StepsController < ApplicationController

  before_action :authorized

  before_action :find_step, only: [:show, :edit, :update, :destroy]

  #displays all steps for a like
  # def index
  # end

  #displays single step (w/ details)
  def show
  end

  def edit
  end

  def update
    @step.update(step_params)
    redirect_to like_path(@step.like)
  end

  def destroy
    @step.destroy
    redirect_to like_path(@step.like)
  end

  private

  def find_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :description, :start_time, :end_time, :location)
  end
end
