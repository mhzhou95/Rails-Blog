class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def show
		@blogs = Blog.find_by_id()
	end

	def new
	end

	def create
	end

	def edit
	end

	def destroy
	end

	private

	def blogs_params
		params.require(:blogs).permit(:title, :content, :user_id)
	end
end
