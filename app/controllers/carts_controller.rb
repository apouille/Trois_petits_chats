class CartsController < ApplicationController
  def show

  end

  def create
  	cart=Cart.create(status: 0, user: current_user)
  end

  def update
  end

  def index
  end
end
