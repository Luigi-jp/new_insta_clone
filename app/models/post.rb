class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :good_users, through: :favorites,
                    source: :user
  has_many :notifications, dependent: :destroy
  
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate  :picture_size
  
  def create_good_notification(current_user)
    temp = Notification.where("visitor_id = ? and visited_id = ? and
                                post_id = ? and comment_id = ?",
                                current_user.id, user_id, id, "good")
    if temp.blank?
      notification = current_user.active_notifications.build(visited_id: user_id,
                                                      post_id: id,
                                                      action: "good")
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
