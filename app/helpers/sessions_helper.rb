module SessionsHelper
	# Logs in the given user.
	def log_in(user)
	  session[:user_id] = user.id
	end
	# returns the current_user (if any).
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
	# checks for user logged in. returns true if the user is logged in, false if not
	def logged_in?
		!current_user.nil?
	end

end
