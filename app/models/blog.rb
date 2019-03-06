class Blog < ApplicationRecord
	 has_one_attached :blog_image
	 belongs_to :user
	 has_many :comments
	 has_many :likes
end
