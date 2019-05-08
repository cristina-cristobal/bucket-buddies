class StepsController < ApplicationController

  before_action :authorized

  before_action only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @step = Step.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_step
    @step = Step.find(params[:id])
  end
end
