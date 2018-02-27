class CommentsController < ApplicationController
	before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
	
	def index
		user = User.find_by_id(session[:user_id])
		blog = Blog.find_by_id(params[:id])
	end

	def new
		@comment = Comment.new
		@blog = Blog.find_by_id(params[:id])
		
	end

	def create
	@user = User.find_by_id(session[:user_id])
	@blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    @comment.user_id = @user.id
    @comment.blog_id = @blog.id
    @comment.save
    redirect_to "/blogs/#{@blog.id}"
	end

	def edit
		@user = User.find_by_id(session[:user_id])
		@blog = Blog.find_by_id(params[:id])
		@comment = Comment.find_by_id(params[:id])

	end
	
	def update
		@blog = Blog.find_by_id(params[:id])
		@comment = Comment.find_by_id(params[:id])
		if @comment.update(comment_params)
		redirect_to "/blogs/#{@comment.blog_id}"

		flash[:message] = "Comment Updated"
	else
		flash[:message] = "Failed to Update Comment"
	end
	end

	def destroy
		@comment = Comment.find_by_id(params[:id])
		@comment.destroy()
		redirect_to '/'
		flash[:message] = "Comment Deleted"
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :user_id, :blog_id)
	end
end
