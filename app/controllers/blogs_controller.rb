class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
		
	end

	def show
		@blog = Blog.find_by_id(params[:id])
		@user = User.find_by_id(@blog.user_id)

	end

	def new
		@user = User.find_by_id(session[:user_id])
		@blog = Blog.new
	end

	def create
		user = User.find(session[:user_id])
		
		blog = Blog.new(blogs_params)
		blog.user_id = user.id
		if blog.save
			redirect_to "/blogs"
			flash[:message] = "Blog Created"
		else
			redirect_to "/blogs/new"
			flash[:message] = "Blog failed to create"
		end
	end

	def edit
		@blog = Blog.find_by_id(params[:id])
	end

	def update 
		@blog = Blog.find_by_id(params[:id])
		if @blog.update(blogs_params)
			flash[:message] = "your blog was successfully updated"
			redirect_to "/blogs/#{@blog.id}"
		else
			flash[:message] = "unable to update blog"
			render	"/blogs/#{@blog.id}/edit"
		end
	end

	def destroy
		@blog = Blog.find_by_id(params[:id])
		@blog.destroy()
		redirect_to '/'
		flash[:message] = "Blog Deleted"
	end


	private

	def blogs_params
		params.require(:blog).permit(:title, :content, :user_id)
	end
end
