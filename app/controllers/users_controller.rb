class UsersController < ApplicationController
  #  before_action :authenticate_user, only: %i[show delete]
  before_action :get_user, only: %i[show edit update]
  
  def show
    @opinion = Opinion.new
    @opinions = @user.opinions.most_recent
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

  def edit;  end
  
  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
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
