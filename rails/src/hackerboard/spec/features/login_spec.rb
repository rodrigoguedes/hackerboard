require "rails_helper"

feature "Login" do
  scenario "with valid credentials" do
    user = User.create!(
      name: "John Doe",
      email: "john@example.org",
      password: "test",
      password_confirmation: "test"
    )

    visit "/"
    click_link "Acessar minha conta"
    fill_in "Seu e-mail", with: user.email
    fill_in "Sua senha", with: "test"
    click_button "Acessar minha conta"

    expect(current_path).to eql("/")
    expect(page).to have_content("Olá, #{user.name}")
  end

  scenario "with invalid credentials"
end