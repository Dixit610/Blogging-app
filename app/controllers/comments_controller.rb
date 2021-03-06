class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
            @blog = Blog.find(params[:blog_id])
            @comment = @blog.comments.create(comment_params.merge(user_id: current_user.id))
            if @comment.user_id != @comment.blog.user.id
                @comment.notifications.create(user_id: @comment.blog.user.id)
            end
            redirect_to blog_path(@blog)
    end

    private
    
    def comment_params
        params.require(:comment).permit(:comment,:blog_id,:user_id)
    end
end
