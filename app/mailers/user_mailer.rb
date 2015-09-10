class UserMailer < ApplicationMailer
	 default from: 'DoNotReply@ucsdmun.org'
 
  def welcome_email(user, url)
    @user = user
    @url = url+"#{user.email}"
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Model UN at UCSD')
  end
end
