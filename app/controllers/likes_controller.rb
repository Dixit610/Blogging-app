class LikesController < ApplicationController
	   before_action :authenticate_user!
       def create
            @blog = Blog.find(params[:blog_id])
            @like_check= Like.find_by("user_id=? AND blog_id=?",current_user.id,@blog.id)

          if @like_check == nil

            @like = @blog.likes.create(like_params.merge(user_id: current_user.id))
            if @like.user_id !=  @like.blog.user.id
                @like.notifications.create(user_id: @like.blog.user.id)
            end
            redirect_to blog_path(@blog)  
          else   
            flash[:danger]="Already liked this blog....."
            redirect_to blog_path(@blog)
          end
          
    end

    private
    
    def like_params
        params.require(:like).permit(:blog_id,:user_id)
    end
end
