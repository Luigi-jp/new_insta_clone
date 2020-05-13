class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy
  
  validates :content, presence: true
  
  def create_comment_notification(current_user)
    notification = current_user.active_notifications.build(visited_id: post.user_id,
                                                    post_id: post_id,
                                                    comment_id: id,
                                                    action: "comment")
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
