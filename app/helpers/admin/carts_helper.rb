module Admin::CartsHelper

	  def order_amount(id)
    subtotal = 0
    id.cart_items.each do |cart_item|
      price = cart_item.item.price
      subtotal += price
    end
    return subtotal
  end
end
