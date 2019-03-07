module Admin::CartsHelper

  def number_of_items(cart)
    return cart.cart_items.length
  end
end
