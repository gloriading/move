class UsersController < ApplicationController

# sign up page-------------------------------------------------------------
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up, #{@user.first_name}!"
      redirect_to home_path
    else
      render :new
    end
  end

#---------------------------------------------------------------------
# This is for every
  def show
    @user = User.find params[:id]
    @user_records = @user.records.order(created_at: :desc)

  end


  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
    end



end
