class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :good_posts, through: :favorites,
                         source: :post
  has_many :active_relationships, class_name: "Relationship",
                                 foreign_key: "follower_id",
                                   dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                    dependent: :destroy
  has_many :following, through: :active_relationships,
                        source: :followed
  has_many :followers, through: :passive_relationships,
                       source: :follower
  has_many :active_notifications, class_name: "Notification",
                                 foreign_key: "visitor_id",
                                   dependent: :destroy
  has_many :passive_notifications, class_name: "Notification",
                                  foreign_key: "visited_id",
                                    dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :fullname, presence: true
  validates :username, presence: true, uniqueness: true
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        username:  auth.info.name,
        fullname: auth.info.name,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end
  
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Post.where("user_id IN (#{ following_ids })
                OR user_id = :user_id", user_id: id)
  end
  
  def follow(other_user)
    following << other_user
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(other_user)
    following.include?(other_user)
  end
  
  def favorite(post)
    good_posts << post
  end
  
  def unfavorite(post)
    favorites.find_by(post_id: post.id).destroy
  end
  
  def favorite?(post)
    good_posts.include?(post)
  end
  
  def self.search(search)
    User.where('username LIKE ?', search)
  end
end
