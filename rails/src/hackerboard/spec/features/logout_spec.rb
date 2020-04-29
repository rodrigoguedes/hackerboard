require "rails_helper"

feature "Logout" do
  scenario "logouts user" do
    user = create(:user)

    login_as(user.email)

    visit home_path
    click_button t("menu.logout")

    expect(current_path).to eql(home_path)
    expect(page).not_to have_content(t("user.greeting", name: user.name))
  end
end