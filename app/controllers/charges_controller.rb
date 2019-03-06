class ChargesController < ApplicationController
	def new
		@cart = current_cart
	end

	def create
		@cart = current_cart
		@amount = (total_cart * 100).round
		@profile_current_user = current_user.profile

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'eur',
	  })

	  @cart.update(stripe_customer_id: charge[:customer], status: 1)
	  flash[:notice] = "Your order is complete"
	  redirect_to profile.path(@profile_current_user.id)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
