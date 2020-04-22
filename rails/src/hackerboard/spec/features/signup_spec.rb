require "rails_helper"

feature "Signup" do
  scenario "with valid data" do
    visit "/"
    click_link "Quero me cadastrar"
    fill_in "Seu nome",	with: "John Doe"
    fill_in "Seu e-mail",	with: "john@example.org"
    fill_in "Sua senha",	with: "test"
    fill_in "Confirme sua senha",	with: "test"
    click_button "Quero me cadastrar"

    expect(current_path).to eql("/login")
    expect(page).to have_content("Cadastro realizado com sucesso")
  end

  scenario "with invalid data" do
    visit "/"
    click_link "Quero me cadastrar"
    click_button "Quero me cadastrar"

    expect(current_path).to eql("/signup")
    expect(page).to have_content("Verifique seus dados antes de continuar.")
  end

  scenario "login with created account"
end