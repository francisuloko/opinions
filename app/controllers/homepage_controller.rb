class HomepageController < ApplicationController
  def index
    @opinion = Opinion.new
    @opinions = Opinion.most_recent
    @user = User.find_by(username: session[:username])
  end
end
