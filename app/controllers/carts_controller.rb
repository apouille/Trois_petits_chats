class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_user_has_a_cart, only: [:show, :edit]
  before_action :verify_cart_status, only: [:show, :edit]
  before_action :verify_user_rights, only: [:show, :edit]
  
  def index
    @cart = Cart.all
  end

  def show
  	@cart = Cart.find(params[:id])
  	@cart_items = @cart.cart_items
    @profile = current_user.profile

	  @subtotal=0
	  @cart_items.each do |cart_item|
		  price = cart_item.item.price
		  @subtotal+=price
		end
	end

  def create
  	cart = Cart.create(status: 0, user: current_user)
  end

  def update
  	cart = Cart.update(status: 0, user: current_user)
  end


private 

def verify_user_has_a_cart
	#Si l'utilisateur n'as pas de panier 
	unless current_user.carts != nil
    flash[:error] = "Ma biche, crée ton panier plutôt que de t'intéresser à ceux des autres"
    redirect_to root_path
    end
end


def verify_cart_status
	#Si le statut du panier visité est 'paid'
	cart_status = Cart.find(params[:id]).status
	cart_id = params[:id]
	if cart_status == "paid"
    flash[:error] = "Ce panier n'existe plus. Rendez-vous dans votre page profile pour accéder à vos commandes passées"
    redirect_to root_path
	end
end


def verify_user_rights
	#si le panier n'est pas celui de l'utilisateur
   url_id = params[:id].to_i
   cart_id = current_user.carts.find_by("status = 0").id
   unless url_id == cart_id
    flash[:error] = "Ce n'est pas bien de vouloir accéder à un panier qui ne vous appartient pas"
    redirect_to root_path
   end

end



end

