class PublishingsController < ApplicationController
  before_action :authenticate_user!
  def create
    s = Share.find params[:share_id]

    if s.publish!
      redirect_to shares_path, notice: 'Your post has been published.'
    else

    end
  end

end
