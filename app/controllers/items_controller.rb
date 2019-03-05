class ItemsController < ApplicationController

  def index
    @items = Item.all
    # @current = current_user.carts.where("status = 0") != nil
  end

  def show
  	@item = Item.find(params[:id])
  end
end
