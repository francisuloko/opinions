class UsersController < ApplicationController
  # before_action :authenticate_user, only: %i[show delete]
  before_action :get_user, only: %i[show edit update]
  
  def show
    @opinion = Opinion.new
    @opinions = @user.opinions.most_recent
    @followers = @user.followers.all
    @followings = @user.following.all
  end
   
  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Accounted created successfully.'
      session[:username] = @user.username
      redirect_to root_path
    else
      render new_user_path
    end
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path(@user.username)
    else
      flash[:notice] = 'Something went wrong'
      render :edit
    end
  end

  private

  def get_user
    @user = User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:fullname, :username, :photo, :cover_image)
  end
end
