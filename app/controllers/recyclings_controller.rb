class RecyclingsController < ApplicationController
  before_action :authenticate_user!
  def create
    s = Share.find params[:share_id]

    if s.recycle!
      redirect_to public_shares_path, notice: 'Your post is now private.'
    else

    end
  end

end
