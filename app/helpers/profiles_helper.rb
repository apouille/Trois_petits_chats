module ProfilesHelper

	def current_user_profile?
    current_user.profile != nil
	end

end
