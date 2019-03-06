class ChargesController < ApplicationController
	after_action :confirmation_send, only: [:create]
		def new
			@cart = current_cart
		end

		def create
			@cart = current_cart

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

		def confirmation_send
      UserMailer.confirmation_email(self).deliver_now
    end

end
