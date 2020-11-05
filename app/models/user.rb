class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minmum: 1, maximum: 20 }
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  attachment :profile_image


  def follow(user_id)
  	follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
  	follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
  	following_user.include?(user)
  end

end
