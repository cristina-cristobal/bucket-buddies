class GoalsController < ApplicationController

  before_action :authorized, except: [:index, :show]

  def index
    if params[:goal]
      @goals = Category.find(goal_params(:category_id)[:category_id]).goals

    else
      @goals = Goal.all_by_likes
    end
  end

  def show
    @goal = Goal.find(params[:id])
    @my_like = @goal.my_like(session[:user_id])
  end

  def new
    @goal = Goal.new

    @like = @goal.likes.build
  end

  # If a goal gas already been created, update the goal, otherwise create a new goal
  def create
    @goal = Goal.find_by(goal_params(:title))
    if @goal
      @goal.assign_attributes(goal_params(likes_attributes: [
          :description,
          "timeline(1i)",
          "timeline(2i)",
          "timeline(3i)",
          :user_id
      ], categories_attributes: [:name]))
      if @goal.valid?
        @goal.save
        redirect_to @goal
      else
        flash["notice"] = "You have already added this goal"
        redirect_to @goal
      end
    else
      @goal = Goal.new(goal_params(:title, likes_attributes: [
          :description,
          "timeline(1i)",
          "timeline(2i)",
          "timeline(3i)",
          :user_id
      ],
                                   category_ids: []))

      if @goal.valid?
        @goal.save
        redirect_to @goal
      else
        render :new
      end
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.assign_attributes(goal_params(likes_attributes: [
        :description,
        "timeline(1i)",
        "timeline(2i)",
        "timeline(3i)",
        :user_id
    ]))
    if @goal.valid?
      @goal.save
      redirect_to @goal
    else
      flash["notice"] = "You have already added this goal"
      redirect_to @goal
    end
  end

  private

  def goal_params(*args)
    params.require(:goal).permit(*args)
  end

end
