class FollowingsController < ApplicationController
  def create
    @following = current_user.request_connections.new(followed_id: params[:user_id])
    
    if @following.save
      flash[:notice] = "You are now following #{User.find(params[:user_id]).fullname}"
    else
      'Something went wrong.'
    end
    redirect_back(fallback_location: root_path)
  end
end
