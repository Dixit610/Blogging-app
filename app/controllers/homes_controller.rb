class HomesController < ApplicationController
	before_action :authenticate_user!,only:[:user_profile,:user_notification]
    def index

	end

	def user_profile

            @user=User.find(current_user.id)
            @blogs = Blog.select(:id,:title,:description).where("user_id=?",current_user.id)
    end
    def user_notification
        @notifications = Notification.all.where(user_id: current_user.id)
        #@notifications.update_attributes(:read_at => Time.now)
        @notifications.each do |n|    
            n.update_attributes(:read_at => Time.now)
        end
    end
end
