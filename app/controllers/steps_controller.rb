class StepsController < ApplicationController

  before_action :authorized

  before_action :find_step, only: [:show, :edit, :update, :destroy]
  #
  def show
  end
  #
  # # def new
  # #   @step = Step.new
  # # end
  # #
  # # def create
  # #   @step = Step.new
  # # end
  #
  # def edit
  #
  # end
  #
  # def update
  #
  # end

  def destroy

  end

  private

  def find_step
    @step = Step.find(params[:id])
  end
end
