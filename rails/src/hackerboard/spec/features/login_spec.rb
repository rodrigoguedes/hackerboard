require "rails_helper"

feature "Login" do
  scenario "with valid credentials" do
    user = create(:user)

    login_as(user.email)

    expect(current_path).to eql(home_path)
    expect(page).to have_content(t("user.greeting", name: user.name))
  end

  scenario "with invalid credentials" do
    visit home_path
    click_link t("menu.login")
    click_button t("form.submit.login")

    expect(current_path).to eql(login_path)
    expect(page).to have_content(alert("login.create"))
  end
end