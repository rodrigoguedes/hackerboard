class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@hackerboard.io'
  layout 'mailer'

  def default_url_options
    {locale: I18n.locale, host: "localhost", port: 3000}
  end
end
