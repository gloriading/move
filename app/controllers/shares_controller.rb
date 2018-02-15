class SharesController < ApplicationController
  before_action :authenticate_user!

  def new
    @share = Share.new
  end

  def create
    @share = Share.new share_params
    @share.user = current_user
    if @share.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def index
    @shares = current_user.shares.order(updated_at: :desc)
  end

  private
  def share_params
    params.require(:share).permit(:content, :image)
  end

end
