module CartsHelper
	def cart_in_progress?
		current_user.carts.find_by("status = 0") != nil
	end

  def total_cart
    current_cart = current_user.carts.find_by("status = 0")

    subtotal=0
    current_cart.cart_items.each do |cart_item|
      price = cart_item.item.price * cart_item.quantity
      subtotal += price
    end
    return subtotal
  end

  def number_of_cart_items
    current_cart = current_user.carts.find_by("status = 0")
    return current_cart.cart_items.length
  end

  def current_cart
    current_cart = current_user.carts.find_by("status = 0")
    return current_cart
  end   

end
