class UserMailer < ApplicationMailer
  default from: 'no-reply@troispetitschats.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'troispetitschats.herokuapp.com/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end


  def confirmation_email(user, items)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    @items = items
    # image à insérer dans l'email si l'url ne fonctionne plus demain matin : <%= image_tag i.item.item_picture, alt: 'item picture' %>

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'troispetitschats.herokuapp.com/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Confirmation de commande')
  end

end
