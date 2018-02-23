class ScreensController < ApplicationController
before_action :authenticate_user!

  def index
    id = current_user.id
    first_name = current_user.first_name
    base_url = Rails.env.production? ? "https://healthymove.herokuapp.com" : "http://localhost:3000"
    target = "#{base_url}/users/#{id}?start_date=#{params[:start_date]}"
    @screenshot = Gastly.screenshot(target)
    @screenshot.selector = '.simple-calendar'
    @image = @screenshot.capture
    date_mark = params[:start_date].split('-')[0..1].join('-')

    # if @image.save("app/assets/images/image-#{id}-#{first_name}.png")
    if @image.save("public/images/image-#{id}-#{first_name}-#{date_mark}.png")
      Screenshot.create(
        user: current_user,
        path: "image-#{id}-#{first_name}-#{date_mark}.png",
        display: date_mark
      )
      uploader = ScreenshotUploader.new
      file = File.open("public/images/image-#{id}-#{first_name}-#{date_mark}.png")
      uploader.store!(file)
      redirect_to user_path(current_user)
    end

  end

end
