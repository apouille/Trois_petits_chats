module ItemsHelper

	def new_article?
	product_id = params[:id].to_i


		current_cart.cart_items.each do |cart_item|
			puts cart_item.item.id
					if cart_item.item.id == product_id
						puts false
						return false
					end
			 
		end
	end
end