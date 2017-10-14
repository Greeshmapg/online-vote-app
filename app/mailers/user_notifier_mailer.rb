class UserNotifierMailer < ApplicationMailer

   def activate_user(email)
    @email = email
    mail( :to => @email,
    :subject => 'sign up for our amazing app' )
  end

  def invite_user(email)
    @email = email
    mail( :to => @email,
    :subject => 'Vote for new categories!!!' )
  end



end
