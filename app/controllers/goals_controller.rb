class GoalsController < ApplicationController

  before_action :authorized, except: [:index, :show]
  before_action :find_goal, only: [:edit, :show, :update]

  def index
    if params[:goal]
      @category = Category.find(goal_params(:category_id)[:category_id])
      @goals = @category.goals
    else
      @goals = Goal.all_by_likes
    end
  end

  def show
    render :index unless @goal
    @my_like = @goal.my_like(session[:user_id])
  end

  def new
    @goal = Goal.new
    @like = @goal.likes.build
  end

  # If a goal gas already been created, like the goal, otherwise create a new goal
  def create
    @goal = Goal.find_by(title: goal_params(:title)[:title].titleize)
    if @goal
      @goal.assign_attributes(goal_params(likes_attributes: [
          :description, :timeline, :user_id
      ], categories_attributes: [:name]))
      if @goal.valid?
        @goal.save
        redirect_to @goal
      else
        flash["notice"] = "You have already added this goal"
        redirect_to @goal
      end
    else
      @goal = Goal.new(goal_params(
                           :title,
                           likes_attributes: [
                               :description,
                               :timeline,
                               :user_id
                           ],
                           category_ids: []
                       ))

      if @goal.valid?
        @goal.save
        redirect_to @goal
      else
        render :new
      end
    end
  end

  private

  def find_goal
    @goal = Goal.find(params[:id])
  end
  def goal_params(*args)
    params.require(:goal).permit(*args)
  end

end
