class Api::V1::SharesController < Api::ApplicationController
before_action :authenticate_user!
before_action :find_share, only: [:show]

  def index
    @shares = current_user.shares.order(updated_at: :desc)
    render json: @shares
  end

  def show
    render json: @share
  end


  private
  def find_share
    @share = Share.find params[:id]
  end

end
