class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find_by_id(session[:user_id])
		@blogs = @user.blogs
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			redirect_to '/users'
			flash[:message] = "Account successfully created"
		else
			flash[:message] = "Failed to create account"
			redirect "/users/new"
		end
	end

	def edit
		@user = User.find_by_id(session[:user_id])
	end

	def update
		@user = User.find_by_id(session[:user_id])
		if @user.update(user_params)
			redirect_to '/users/show'
			flash[:message] = "Account Information Updated"
		else
			flash[:message] = "Failed to Update Account Data"
			redirect_to "/users/#{session[:user_id]}/edit"
		end
	end


	def destroy
		@user = User.find_by_id(session[:user_id])
		@user.destroy()
		session[:user_id] = nil
		flash[:message] = "Account Deleted"
		redirect_to '/'
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end

end
