class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :blog
	has_many :notifications, as: :notifiable,dependent: :destroy
end
