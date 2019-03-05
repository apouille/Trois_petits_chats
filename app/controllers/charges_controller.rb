class ChargesController < ApplicationController
	def new
		@cart = Cart.find(2)
	end

	def create
		@cart = Cart.find(2)
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'usd',
	  })

	  @cart.update(stripe_customer_id: charge[:customer], status: 1)
	  flash[:notice] = "Your order is complete"
	  redirect_to root_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
