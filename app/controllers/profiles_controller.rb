class ProfilesController < ApplicationController
  def new
  	@profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    if @profile.save
       flash[:notice] = "Vous avez bien créer votre profil"
       redirect_to root_path
     else
      flash.now[:error] = 'Il manque des informations...'
      render 'new'
    end

  end

  def edit
  	@profile = Profile.find_by(user_id: current_user.id)
  	puts "*"*60
    puts @profile
    puts current_user.id
  	puts "*"*60
  end

  def update
  	@profile = Profile.find_by(user_id: current_user.id)
  	post_params = params[:profile]
    if @profile.update(first_name: post_params[:first_name], last_name: post_params[:last_name], street: post_params[:street], city: post_params[:city], zip_code: post_params[:zip_code], phone_number: post_params[:phone_number])
      redirect_to root_path
    else
      flash[:danger] = "Il manque des informations"
      render :new 
    end
  end

  def show
  	@profile = Profile.find_by(user_id: current_user.id)
  end

  private

  def profile_params
  	params.permit(:first_name, :last_name, :street, :city, :zip_code, :phone_number)
  end

end
