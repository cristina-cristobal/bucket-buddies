class StepsController < ApplicationController

  before_action :authorized
  before_action :find_like, only: [:new]
  before_action :find_step, only: [:show, :edit, :update, :destroy]

  #displays all steps for a like
  # def index
  # end

  #displays single step (w/ details)

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.valid?
      @step.save
      redirect_to @step
    else
      @like = Like.find(step_params[:like_id])
      render :new
    end
  end

  def show
  end

  def edit
    @like = @step.like
  end

  def update
    @step.assign_attributes(step_params)
    if @step.valid?
      @step.save
    redirect_to @step
    else
      @like = Like.find(step_params[:like_id])
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to like_path(@step.like)
  end

  private

  def find_like
    @like = Like.find(params[:like_id])
  end
  def find_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :description, :start_time, :end_time, :location, :like_id)
  end
end
