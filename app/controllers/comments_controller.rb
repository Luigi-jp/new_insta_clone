class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      @comment.create_comment_notification(current_user)
      redirect_to request.referrer || root_url
    else
      redirect_to root_url
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = "削除しました。"
    redirect_to request.referrer || root_url
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
