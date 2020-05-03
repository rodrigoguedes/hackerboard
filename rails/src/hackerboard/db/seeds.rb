filepath = File.expand_path("../seeds/#{Rails.env}.rb", __FILE__)
require filepath if File.file? (filepath)

# create digo user
digo = FactoryBot.create(:user,
  name: "Rodrigo Guedes de Souza",
  email: "teste@guedesdesouza.com.br"
)

# create categories
categories = ["Ruby", "JavaScript", "Java"].map do |name|
  FactoryBot.create(:category, name: name)
end

# create 30 users
users = [digo]

30.times do
  name = Faker::Name.name
  email = I18n.transliterate(Faker::Internet.email(name: name))

  users << FactoryBot.create(:user,
    name: name,
    email: email
  )
end

# create 100 questions
questions = []

# title: Faker::Lorem.sentence.chomp(".") << "?",
# content: Faker::Lorem.paragraphs([*1..4].sample).join("\n\n")

100.times do
  questions << FactoryBot.create(:question,
    category: categories.sample,
    user: users.sample,
    title: Faker::Lorem.question,
    content: Faker::Lorem.paragraphs(number: [*1..4].sample).join("\n\n")
  )
end