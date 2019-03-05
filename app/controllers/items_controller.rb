class ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @current_profile = Profile.find_by(user_id: current_user.id)
    puts "$"*100
    puts params 
    puts "$"*100
    puts Profile.find_by(user_id: current_user.id)
    puts "$"*100
  end

  def show
  	@item = Item.find(params[:id])
  end
end
