class ScreensController < ApplicationController
  before_action :authenticate_user!

  def index
    basic_setup
    @screenshot = Gastly.screenshot(@target)
    @screenshot.selector = '.simple-calendar'
    @image = @screenshot.capture

    if @image.save("public/images/#{@img_path}")
      flash[:success] = 'Screenshot has been created successfully.'
      create_screenshot_record_for_users
      upload_screenshot_to_aws
      redirect_to user_path(current_user)
    end
  end

  private

  def basic_setup
    id = current_user.id
    first_name = current_user.first_name
    base_url = Rails.env.production? ? "https://healthymove.herokuapp.com" : "http://localhost:3000"
    @target = "#{base_url}/users/#{id}?start_date=#{params[:start_date]}"
    @date_mark = params[:start_date].split('-')[0..1].join('-')
    @img_path = "image-#{id}-#{first_name}-#{@date_mark}.png"
  end

  def create_screenshot_record_for_users
    Screenshot.create(
      user: current_user,
      path: @img_path,
      display: @date_mark
    )
  end

  def upload_screenshot_to_aws
    uploader = ScreenshotUploader.new
    file = File.open("public/images/#{@img_path}")
    uploader.store!(file)
  end

end
