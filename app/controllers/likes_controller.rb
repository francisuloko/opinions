class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(opinion_id: params[:opinion_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, opinion_id: params[:opinion_id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
