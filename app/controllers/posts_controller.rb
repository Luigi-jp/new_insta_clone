class PostsController < ApplicationController
  before_action :authenticate_user!
  
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
    
  end
  
  private
    def post_params
      params.require(:post).permit(:picture)
    end
end
