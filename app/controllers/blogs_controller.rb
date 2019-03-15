class BlogsController < ApplicationController
	before_action :authenticate_user!,only:[:new,:edit,:create,:update,:destroy]
	def index
		@departments = Department.all
		if detail=params[:blog]
	      #@blogs = Blog.connection.execute("SELECT * FROM blogs WHERE (title LIKE '%#{detail[:search]}%')")
	      @blogs=Blog.where("title LIKE ? OR description LIKE ?","%#{detail[:blog_search].capitalize}%","%#{detail[:blog_search]}%").order(updated_at: :desc)
	     elsif params[:department]
	       @blogs = department_wish(params[:department][:department_id])
	    else
	      @blogs = Blog.all.order(updated_at: :desc)
	    end
	end

	def new
	      @blog = Blog.new

	end
	def create
	    @blog = Blog.new(blog_params.merge(user_id: current_user.id)) 
	    if @blog.save
	      flash[:success]="Blog was successfully created"
	      redirect_to @blog
	    else
	      render 'new'
	    end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def edit

      @blog = Blog.find(params[:id])

    end

    def update
    	@blog = Blog.find(params[:id])
	    @blog.update(blog_params)
	    
	    if @blog.save
	      flash[:success]="Blog successfully updated"
	      redirect_to @blog
	    else
	      render 'edit'
	    end
    end

    def destroy
    	@blog = Blog.find(params[:id])
	    @blog.destroy
	    flash[:success]="Blog successfully deleted"
	    redirect_to profile_path(current_user.id)
    end
	private

	def blog_params
		params.require(:blog).permit(:title,:description,:user_id,:department_id,:blog_image)
	end

	def department_wish(dep_id)
	    @department = Department.find(dep_id)
	    return @department.blogs.order(updated_at: :desc)
	end
end
