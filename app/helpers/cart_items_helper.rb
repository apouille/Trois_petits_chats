module CartItemsHelper
	def item_in_cart?(id)
		result = false
		current_user.carts.each do |cart|
			cart.cart_items.each do |cart_item|
				if id == cart_item.item.id
					result = true
				end
			end
		end
		return result
	end
end
