class HomepageController < ApplicationController
  before_action :authenticate_user
  
  def index
    @user = User.find_by(username: session[:username])
    @opinion = Opinion.new
    @opinions = Opinion.most_recent
    @not_following = current_user.not_following
  end
end
