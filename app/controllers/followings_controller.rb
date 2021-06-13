class FollowingsController < ApplicationController
  def create
    @following = Following.create(followed_id: params[:user_id], follower_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    following = Following.find_by(followed_id: params[:user_id])
    following.destroy
    redirect_back(fallback_location: root_path)
  end
end
