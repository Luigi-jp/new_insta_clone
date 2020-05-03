class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
         
  has_many :posts, dependent: :destroy
         
  validates :fullname, presence: true
  validates :username, presence: true, uniqueness: true
end
