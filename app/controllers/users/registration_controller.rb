class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :cart_create, only: [:create]

private
  
  def cart_create
    @cart = Cart.new(user_id: current_user.id, status: 0)
    @cart.save
  end
end