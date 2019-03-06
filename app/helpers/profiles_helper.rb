module ProfilesHelper

	def current_user_profile?
    current_user.profile != nil
	end

	def user_rights?
  	@profile = Profile.find(params[:id])
  	unless current_user == @profil.user
  	flash[:danger] = "Vous n'avez pas les droits"
    redirect_to profiles_path(current_user.id)
    end

	end

end
