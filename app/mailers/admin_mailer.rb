class AdminMailer < ApplicationMailer
  default from: 'no-reply@troispetitschats.com'


  def new_order_email(user, cart_items)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    @cart_items = cart_items # cart_items

    @subtotal=0
    @shipping_fee = @cart_items.length * 2
    @cart_items.each do |i|
      price = i.item.price * i.quantity
      @subtotal += price
    end

    @total = @subtotal + @shipping_fee

    @admin_email = 'troispetitschats@yopmail.com'
    # image à insérer dans l'email si l'url ne fonctionne plus demain matin : <%= image_tag i.item.item_picture, alt: 'item picture' %>

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'troispetitschats.herokuapp.com/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin_email, subject: 'Nouvelle commande')
  end
end
