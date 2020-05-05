class PagesController < ApplicationController
  def index
    if user_signed_in?
      @comment = current_user.comments.build
      @feed_items = current_user.feed
    end
  end
end
