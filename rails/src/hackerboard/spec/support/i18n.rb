# RSpec.configure do |config|
#   config.before(:all) do
#     # I18n.exception_handler = proc do |scope, *args|
#     #   message = scope.to_s
#     #   raise message unless message.include?(".i18n.plural.rule")
#     # end

#     I18n.locale = ENV.fetch("LOCALE", I18n.default_locale)
#   end

#   config.after(:all) do
#     I18n.exception_handler = I18n::ExceptionHandler.new
#     I18n.locale = I18n.default_locale
#   end
# end