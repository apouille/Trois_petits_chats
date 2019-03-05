module CartsHelper
	def cart_in_progress?
		current_user.carts.where("status = 0") != nil
	end
end
