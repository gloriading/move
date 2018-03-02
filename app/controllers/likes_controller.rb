class LikesController < ApplicationController

  before_action :authenticate_user!

    def create
      share = Share.find params[:share_id]
       if can? :like, share
           like = Like.new(share: share, user: current_user)
           if like.save
             flash[:success] = 'Thank you for liking this post.'
             redirect_to public_shares_path
           else
             flash[:warning] = 'Cannot like this post.'
             redirect_to public_shares_path
           end
       else
         head :unauthorized
       end
    end

    def destroy
      like = Like.find params[:id]
      if can? :destroy, like
        like.destroy
        flash[:info] = 'Like has been removed.'
        redirect_to public_shares_path
      else
        head :unauthorized
      end
    end



end
