module CartsHelper
	def cart_in_progress?
		current_user.carts.where("status = 0") != nil
	end

  def total_cart
    current_cart = current_user.carts.find_by("status = 0")

    subtotal=0
    current_cart.cart_items.each do |cart_item|
      price = cart_item.item.price
      subtotal += price
    end
    return subtotal
  end

end
