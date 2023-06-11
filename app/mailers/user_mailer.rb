class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email (user)
    # On recupère le paramètre user pour pouvoir le passer à la view en @user
    @user = user

    # @url, variable qu'on utilisera dans la view d'email
    @url = 'http://eventfreeka.fr/login'

    # Appel à mail (), méthode qui permet d'envoyer l'email en définissat destinataire et sujet
    mail(to: @user.email, subject: 'Bienvenu chez nous !')
  end

  def event_email (event)
    # @event = event
    # id = @event.admin_id
    @event_user = User.find(event.admin_id)
    puts "$" * 60
    puts @event_user
    puts "$" * 60
    @url = 'http://eventfreeka.fr/login'
    mail(to: @event_user.email, subject: 'Event creation !')
  end
end
