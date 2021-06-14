class HomepageController < ApplicationController
  before_action :authenticate_user

  def index
    @user = User.find_by(username: session[:username])
    @opinion = Opinion.new
    @opinions = Opinion.most_recent
    @who_to_follow = current_user.who_to_follow
  end
end
