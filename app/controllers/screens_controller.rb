class ScreensController < ApplicationController


  def index

    # id = current_user.id
    # target = `http://localhost:3000/users/#{id}`
    @screenshot = Gastly.screenshot('http://localhost:3000')
    # @screenshot.selector = '#main'
    @image = @screenshot.capture
    @image.save('app/assets/images/test.png')
    # if @image.save('app/assets/images/calendar_image.png')
    #   redirect_to user_path(current_user)
    # end

  end

end
