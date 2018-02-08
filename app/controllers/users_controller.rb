class UsersController < ApplicationController
# different layouts for different actions in one controller
layout :diverse_layout

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
# Calendar page

  def show
    @user = User.find params[:id]
    @user_records = @user.records.order(created_at: :desc)
    @record = Record.new
    @record_months = @user_records.group_by {|t| t.start_time.beginning_of_month }
    p @record_months
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

    def diverse_layout
      if action_name == 'new' || action_name == 'create'
        'application'
      else
        'content'
      end
    end

end
