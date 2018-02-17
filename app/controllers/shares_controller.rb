class SharesController < ApplicationController
  layout 'share'
  before_action :authenticate_user!
  before_action :find_share, only: [:edit, :update, :destroy]

  def new
    # @share = Share.new
  end

  def create
    @share = Share.new share_params
    @share.user = current_user
    if @share.save
      redirect_to shares_path
    else
      flash[:notice] = 'error'
      redirect_to shares_path
    end
  end

  def index
    @share = Share.new
    @shares = current_user.shares.order(updated_at: :desc)
  end

  def edit
  end

  def update
    if @share.update share_params
      redirect_to shares_path
    else
      render :edit
    end
  end

  def destroy
    @share.destroy
    redirect_to shares_path
  end

  private
  def share_params
    params.require(:share).permit(:content, :image)
  end

  def find_share
    @share = Share.find params[:id]
  end

end
