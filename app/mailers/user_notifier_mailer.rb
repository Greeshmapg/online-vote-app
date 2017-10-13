class UserNotifierMailer < ApplicationMailer

   def invite_user(email)
    @email = email
    mail( :to => @email,
    :subject => 'sign up for our amazing app' )
  end



end
