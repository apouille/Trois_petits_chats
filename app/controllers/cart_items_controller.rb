class CartItemsController < ApplicationController
  before_action :cart_verification, only: [:create]

  def index
  end

  def show
  end

  def new
    @cart_item = CartItem.new 
  end

  def create
    @cart_item =CartItem.new(quantity: 1, cart: current_user.carts.last, item_id: params[:format])
    @cart_item.save
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    flash[:notice] = "Item successfully removed"
    redirect_back fallback_location: root_path
  end


private
#/ Cas où il a des carts mais aucune d'ouvert

  def cart_verification
    if  current_user.carts.find_by("status = 0") != nil
      puts "*"*100
      puts "already have a cart"
      puts current_user.carts.find_by("status = 0")
      puts "*"*100
    else 
      puts "*"*100
      puts "don'thave a cart"
      puts "*"*100
      @cart = Cart.new(user_id: current_user.id, status: 0)
      @cart.save
    end
  end

end
