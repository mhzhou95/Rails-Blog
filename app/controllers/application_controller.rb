class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def current_user
  	@current_user = User.find_by_id(session[:user_id])
  end 


def authenticate
    unless current_user 
    	flash[:message] = "You are not logged in!"
    	redirect_to "/login"
	end
end


end




