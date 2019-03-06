module ChargesHelper
	 def shipping_fees
    current_cart = current_user.carts.find_by("status = 0")
    return current_cart.cart_items.length*2
  end
end
