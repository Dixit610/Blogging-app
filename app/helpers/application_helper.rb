module ApplicationHelper
	def noti_messages
		 Notification.where(:user_id => current_user.id, :read_at => nil).count
	end
end
