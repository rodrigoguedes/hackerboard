require "rails_helper"

feature "Add new question" do
  scenario "when unlogged" do
    visit home_path
    click_link t("menu.add_question")

    expect(current_path).to eql(login_path)
    expect(page).to have_content(alert("must_be_logged"))
  end

  scenario "with valid data" do
    user = create(:user)
    login_as user.email
    
    visit home_path
    click_link t("menu.add_question")

    fill_in label("question.title"), with: "Some generic question"
    fill_in label("question.content"), with: "Some awesome question content"
    select "Ruby", from: label("question.category")
    click_button t("helpers.submit.question.create")

    expect(page).to have_content(notice("question.create"))
  end

  scenario "with invalid data"
end