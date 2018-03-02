class RecyclingsController < ApplicationController
  before_action :authenticate_user!

  def create
    share = current_user.shares.find params[:share_id]

    if share.recycle!
      flash[:info] = 'Your post is now private.'
      redirect_to public_shares_path
    else

    end
  end

end
