class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
    @like = @goal.likes.build
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.valid?
      @goal.save
      redirect_to @goal
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, likes_attributes: [:description, "timeline(1i)", "timeline(2i)", "timeline(3i)", :user_id])
  end

end
