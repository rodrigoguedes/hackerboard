class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    #attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
    mail to: @user.email
  end
end