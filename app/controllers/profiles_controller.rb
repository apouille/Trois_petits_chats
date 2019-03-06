class ProfilesController < ApplicationController
before_action :authenticate_user!, only: [:show, :edit]

  def new
  	@profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @current_cart = current_user.carts.where("status = 0")[0]


    if @profile.save
       flash[:notice] = "Vous avez bien créé votre profil"
       redirect_to cart_path(@current_cart.id)
     else
      flash.now[:error] = 'Il manque des informations...'
      redirect_to cart_path(@current_cart.id)
    end

  end

  def edit
  	@profile = Profile.find_by(user_id: current_user.id)
  end

  def update
  	@profile = Profile.find_by(user_id: current_user.id)
    @current_cart = current_user.carts.where("status = 0")[0]
  	post_params = params[:profile]
    if @profile.update(first_name: post_params[:first_name], last_name: post_params[:last_name], street: post_params[:street], city: post_params[:city], zip_code: post_params[:zip_code], phone_number: post_params[:phone_number])
      redirect_to cart_path(@current_cart.id)
    else
      flash[:danger] = "Il manque des informations"
      redirect_to cart_path(@current_cart.id)
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
