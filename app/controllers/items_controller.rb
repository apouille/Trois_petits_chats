class ItemsController < ApplicationController
before_action :cart_verification, only: [:index]


  def index
    @items = Item.all.order(:id)
  end

  def show
  @item = Item.find(params[:id].to_i)
  @item.increment!(:view)
  @best_items = Item.all.order('view DESC').first(3)
  end

  def new
    @item = Item.new
  end

  def create
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
