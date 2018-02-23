class CommentsController < ApplicationController
	def index
		user = User.find_by_id(session[:user_id])
		blog = Blog.find_by_id(params[:id])
	end
	def new
		@blog = Blog.find_by_id(params[:id])
		@comment = Comment.new
		end

	def create
		
		user = User.find_by_id(session[:user_id])
		blog = Blog.find_by_id(params[:id])
		comment = Comment.new(message: params[:message], user_id: user.id, blog_id: blog.id)
		redirect_to "/blogs"
		# if comment.save
		# 	redirect_to "/blogs/#{blog.id}"
		# 	flash[:message] = "comment created"
		# else
		# 	flash[:message]= "fail to create comment"
		# 	redirect_to "/blogs/#{blog.id}"
		# end
	end

	def edit
	end
	
	def destroy
	end

	def destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :user_id, :blog_id)
	end
end
