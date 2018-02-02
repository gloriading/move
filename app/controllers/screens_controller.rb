class ScreensController < ApplicationController


  def index

    id = current_user.id
    target = "http://localhost:3000/users/#{id}"
    @screenshot = Gastly.screenshot(target)
    # @screenshot.selector = '#main'
    @screenshot.selector = '.simple-calendar'
    @image = @screenshot.capture
    @image.resize(width: 600, height: 600)
    if @image.save('app/assets/images/test.png')
      redirect_to user_path(current_user)
    end
    # if @image.save('app/assets/images/calendar_image.png')
    #   redirect_to user_path(current_user)
    # end

  end

end
