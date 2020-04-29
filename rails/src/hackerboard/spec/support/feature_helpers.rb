module FeatureHelpers
  def login_as(email)
    visit home_path
    click_link t("menu.login")
    fill_in label("login.email"), with: email
    fill_in label("login.password"), with: "test"
    click_button t("form.submit.login")
  end

  def t(scope, options = {})
    I18n.t(scope, options)
  end

  def alert(scope, options = {})
    I18n.t("flash.#{scope}.alert", options)
  end

  def notice(scope, options = {})
    I18n.t("flash.#{scope}.notice", options)
  end

  def label(scope, options = {})
    I18n.t(scope, options.merge(scope: "form.labels"))
  end
end

RSpec.configure do |config|
  config.include(FeatureHelpers, type: :feature)

  config.before(:each, type: :feature) do
    # puts "----------------------"
    # puts ENV.fetch("LOCALE", I18n.locale)
    # puts "----------------------"
    # default_url_options[:locale] = I18n.default_locale
    default_url_options[:locale] = ENV.fetch("LOCALE", I18n.default_locale)
  end  
end
