class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    @posts = @user.posts
  end
end
