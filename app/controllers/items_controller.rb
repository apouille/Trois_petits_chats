class ItemsController < ApplicationController
before_action :cart_verification, only: [:index]


  def index
    @items = Item.all
  end

  def show
  @item = Item.find(params[:id].to_i)
  @item.increment!(:view)
  @best_items = Item.all.order('view DESC').first(3)
  puts '$'*100
  puts @best_items
  puts @best_items.first.view
  puts @best_items.last.view
  puts @best_items[2].view

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(title: params[:title],
                       description: params[:description],
                       price: params[:price],
                       author: params[:author],
                       view: params[:view],
                       dimension: params[:dimension],
                       image_url: params[:image_url]
                       )
    @item.item_picture.attach(params[:item_picture])

    if @item.save # essaie de sauvegarder en base @item
      redirect_to item_path(@item.id), :success => "Item créé !"
    else
      render 'new'
    end

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
