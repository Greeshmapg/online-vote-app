class UserNotifierMailer < ApplicationMailer


  # include SendGrid
  # sendgrid_category :use_subject_lines
  # sendgrid_enable   :ganalytics, :opentrack
  # sendgrid_unique_args :key1 => "value1", :key2 => "value2"

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
