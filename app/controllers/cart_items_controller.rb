class CartItemsController < ApplicationController
  def index
  end

  def show
  end

  def create
    cart_item =Cart_Item.create(quantity: 1, cart: current_user.carts[0],item: params[:id])
  end

  def update
  end

  def destroy
  end
end
