FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "john@example.org" }
    password { "test" }
    password_confirmation { "test" }
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end