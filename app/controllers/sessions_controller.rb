class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user
      session[:username] = @user.username
      flash[:notice] = "You signed in successfully."
      redirect_to root_path
    else
      flash[:notice] = "Form is invalid"
      render :new
    end
  end

  def destroy
    session[:username] = nil
    flash[:success] = 'You logged out successfully.'
    redirect_to login_path
  end
end
