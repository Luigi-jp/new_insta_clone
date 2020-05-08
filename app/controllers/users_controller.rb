class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
  
  def search
    @users = User.search(params[:search])
  end
end