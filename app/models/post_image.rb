class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :post_images, dependent: :destroy
	validates :title, presence: true, length: { maximum: 50 }
	validates :body, presence: true, length: { maximum: 200 }
end
