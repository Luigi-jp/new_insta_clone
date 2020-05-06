class FavoritesController < ApplicationController
  
  def create
    @post = Post.find_by(id: params[:post_id])
    current_user.favorite(@post)
    respond_to do |format|
      format.html { root_url }
      format.js
    end
  end
  
  def destroy
    @post = Favorite.find_by(id: params[:id]).post
    current_user.unfavorite(@post)
    respond_to do |format|
      format.html { root_url }
      format.js
    end
  end
end
