class LikesController < ApplicationController

  before_action :authenticate_user!

    def create
      s = Share.find params[:share_id]
       if can? :like, s
           like = Like.new(share: s, user: current_user)
           if like.save
             redirect_to public_shares_path, notice: 'Liked'
           else
             redirect_to public_shares_path, alert: 'Couldn\'t like'
           end
       else
         head :unauthorized
       end
    end

    def destroy
      like = Like.find params[:id]
      if can? :destroy, like
        like.destroy
        redirect_to public_shares_path, notice: 'Like removed'
      else
        head :unauthorized
      end
    end



end
