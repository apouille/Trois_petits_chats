class Admin::CartsController < AdminController

	def index
	@orders = Cart.all.where("status=1").order(:id)
	@carts = Cart.all.where("status=0").order(:id)
	end

	def show
	@cart = Cart.find(params[:id])
	@cart_items = @cart.cart_items
	end
end
