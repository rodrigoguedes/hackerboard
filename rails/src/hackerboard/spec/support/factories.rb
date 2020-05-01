FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "john@example.org" }
    password { "test" }
    password_confirmation { "test" }
  end

  factory :category do
    name { "Some Category"}
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end