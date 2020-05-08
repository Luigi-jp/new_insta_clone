class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user
    else
      render 'posts/new'
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "削除しました。"
    redirect_to request.referrer || root_url
  end
  
  private
    def post_params
      params.require(:post).permit(:picture)
    end
    
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
