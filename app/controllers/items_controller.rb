class ItemsController < ApplicationController
before_action :cart_verification, only: [:index]

  def index
    @items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  private
#/ Cas où il a des carts mais aucune d'ouvert

  def cart_verification
    if  (signed_in?) && (current_user.carts.find_by("status = 0") == nil)
      @cart = Cart.new(user_id: current_user.id, status: 0)
      @cart.save      
    end
  end
end
