class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Welcome back! You have been logged in.'
      redirect_to user
    else
      flash.now[:danger] = 'Wrong email or password.'
      render :new
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

end
