class Admin::UsersController < AdminController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@profile = @user.profile
		@orders = @user.carts.where("status=1")
	  @carts = @user.carts.where("status=0")
	end

end
