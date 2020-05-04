class PagesController < ApplicationController
  def index
    if user_signed_in?
      @feed_items = current_user.feed
    end
  end
end
