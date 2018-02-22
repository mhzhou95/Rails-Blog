class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


def authenticate
   if session[:user_id] == nil
      redirect_to root_path
	end
end

end


