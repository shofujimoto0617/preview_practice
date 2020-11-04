class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minmum: 1, maximum: 20 }
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :profile_image
end
