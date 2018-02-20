class SharesController < ApplicationController
  layout 'share'
  before_action :authenticate_user!
  before_action :find_share, only: [:edit, :update, :destroy]

  def new
    @share = Share.new
  end

  def create
    @share = Share.new share_params
    @share.user = current_user
    if @share.save
      redirect_to shares_path
    else
      # flash[:notice] = 'error'
      render :new
    end
  end

  def index
    @shares = current_user.shares.order(updated_at: :desc)
  end

  def edit
  end

  def update
    @share.remove_image!
    @share.save
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

  def public

    @shares = Share.order(updated_at: :desc)

    @liked = params[:liked]
    if @liked
      @published = current_user.liked_shares.where(aasm_state: 'published')
    else
      @published = @shares.where(aasm_state: 'published')
    end
  end


  private
  def share_params
    params.require(:share).permit(:content, :image)
  end

  def find_share
    @share = Share.find params[:id]
  end

end
