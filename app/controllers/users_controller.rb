class UsersController < ApplicationController
  before_action :only_see_self_page, only: [:show]
  before_action :find_user, only: [:show]
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
      flash[:success] = "Thank you for joinning 'move', #{@user.first_name}!"
      redirect_to @user
    else
      render :new
    end
  end

# Calendar page ----------------------------------------------------

  def show
    @user_records = @user.records.order(created_at: :desc)
    @record = Record.new
    @user_records_by_start_time = @user.records.order(start_time: :asc)
    @record_months = @user_records_by_start_time.group_by {|t| t.start_time.beginning_of_month }

    user_screenshots
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

  def find_user
    @user = User.find params[:id]
  end

  def user_screenshots
    @uploaded_screenshots = @user.screenshots
    @uploaded_screenshot_group_by_display = @uploaded_screenshots.order(display: :desc).order(created_at: :desc).group_by { |s| s.display }
    # group all screenshots by display then in the view,
    # only take the first of the array
  end

  def only_see_self_page
    @user = User.find params[:id]
    if current_user != @user
      flash[:warning] = "You are only allow to view your own page."
      redirect_to user_path(current_user)
    end
  end

end
