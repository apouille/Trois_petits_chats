class Admin::CartsController < AdminController

	def index
	@orders = Cart.all.where("status=1")
	@carts = Cart.all.where("status=0")
	end
end
