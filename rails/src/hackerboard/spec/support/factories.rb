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

  factory :question do
    title { "Some title"}
    content { "Some content" }
    association :category
    association :user
  end
end
