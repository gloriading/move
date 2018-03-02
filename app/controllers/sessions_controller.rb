class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session].present?
      regular_log_in
    else
      # Log in as Guest User
      if Rails.env.production? 
        user = User.find 2
      else
        user = User.find 13
      end
      session[:user_id] = user.id
      redirect_to user
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'You are logged out! Please come back soon and stay moved.'
    redirect_to home_path
  end


  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def regular_log_in
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back! #{user.first_name}."
      redirect_to user
    else
      flash.now[:danger] = "Invalid log in, please try again."
      render :new
    end
  end

end
