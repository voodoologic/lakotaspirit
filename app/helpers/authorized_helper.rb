module AuthorizedHelper
	def authorized?(required_access_level)
		if @current_user && @current_user.user_level >= required_access_level
		return true
	end
end