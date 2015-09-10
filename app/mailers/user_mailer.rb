class UserMailer < ApplicationMailer
	 default from: 'DONOTREPLY@ucsdmun.org'
 
  def welcome_email(user, url)
    @user = user
    @url = url
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Model United Nations at UCSD')
  end

  def change_password_mail(user)
  	@user = user
  	mail(to: @user.email, subject: 'Your Password changed.')
  end

  def new_contact_mail(user, contact)
  	@contact = contact
  	mail(to: user.email, subject: 'New Contact')
  end
end
