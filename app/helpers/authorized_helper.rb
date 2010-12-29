module AuthorizedHelper
	def authorized?
		if @current_user && @current_user.user_level >= required_access_level
			return true
		end
	end
	#environmental variable here
	def required_access_level
		:yield 	
	end
end