class Like < ApplicationRecord
	belongs_to :user
	belongs_to :blog
	has_many :notifications, as: :notifiable,dependent: :destroy

	after_create :create_notification

	def create_notification
		self.notifications.create(user_id: self.blog.user.id)
	end
end
