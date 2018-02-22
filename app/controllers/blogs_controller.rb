class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
	end

	def show
		@blog = Blog.find_by_id(params[:id])
		@user = User.find_by_id(@blog.id)
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
	end

	def destroy
	end

	private

	def blogs_params
		params.require(:blog).permit(:title, :content, :user_id)
	end
end
