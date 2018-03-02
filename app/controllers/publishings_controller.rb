class PublishingsController < ApplicationController
  before_action :authenticate_user!
  def create
    share = current_user.shares.find params[:share_id]

    if share.publish!
      flash[:success] = 'Your post has been published.'
      redirect_to shares_path
    else
      flash[:warning] = 'Fail to publish this post.'
      redirect_to shares_path
    end
  end

end
