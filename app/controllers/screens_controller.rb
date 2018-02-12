class ScreensController < ApplicationController


  def index
    id = current_user.id
    first_name = current_user.first_name
    # target = "http://localhost:3000/users/#{id}"
    target = "http://localhost:3000/users/#{id}?start_date=#{params[:start_date]}"
    @screenshot = Gastly.screenshot(target)
    @screenshot.selector = '.simple-calendar'
    @image = @screenshot.capture
    # @image.resize(width: 500, height: 500)

    # if @image.save('app/assets/images/test.png')
    if @image.save("app/assets/images/image-#{id}-#{first_name}.png")
      redirect_to user_path(current_user)
    end

  end

end
