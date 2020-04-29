require "rails_helper"

feature "Signup" do
  scenario "with valid data" do
    visit home_path
    click_link t("menu.signup")
    fill_in label("signup.name"),	with: "John Doe"
    fill_in label("signup.email"),	with: "john@example.org"
    fill_in label("signup.password"),	with: "test"
    fill_in label("signup.password_confirmation"),	with: "test"
    click_button t("helpers.submit.user.create")

    expect(current_path).to eql(login_path)
    expect(page).to have_content(notice("signup.create"))
  end

  scenario "with invalid data" do
    visit home_path
    click_link t("menu.signup")
    click_button t("helpers.submit.user.create")

    expect(current_path).to eql(signup_path)
    expect(page).to have_content(t("form.error_message"))
  end

  scenario "login with created account" do
    visit home_path

    click_link t("menu.signup")
    fill_in label("signup.name"),	with: "John Doe"
    fill_in label("signup.email"),	with: "john@example.org"
    fill_in label("signup.password"),	with: "test"
    fill_in label("signup.password_confirmation"),	with: "test"
    click_button t("helpers.submit.user.create")

    login_as("john@example.org")

    expect(current_path).to eql(home_path)
    expect(page).to have_content(t("user.greeting", name: "John Doe"))
  end
end