module Locale
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  private
  def set_locale
    I18n.locale = params[:locale].to_s
  end

  def default_url_options
    { locale: I18n.locale }
  end
end