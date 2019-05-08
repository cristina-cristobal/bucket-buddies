class LikesController < ApplicationController

  before_action :authorized

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to user_path(get_current_user)
  end

end
