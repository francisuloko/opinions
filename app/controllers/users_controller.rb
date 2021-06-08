class UsersController < ApplicationController
  before_action :get_user, only: [:index]
  before_action :authenticate_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit;  end

  def create
    @user = User.new(user_params)

    if @user.save
        flash[:success] = 'Accounted created successfully'
        session[:current_user] = @user.username
        redirect_to @user
    else
        render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to new_user_path
    else
      render :edit
    end
  end

  private

  def get_user
    @user = User.find_by(params[:id])
  end

  def user_params
    params.require(:user).permit(:fullname, :username, :photo, :cover_image)
  end
end
