require "rails_helper"

feature "Add new question" do
  scenario "when unlogged" do
    visit home_path
    click_link t("menu.add_question")

    expect(current_path).to eql(login_path)
    expect(page).to have_content(alert("must_be_logged"))
  end

  scenario "with valid data" do
    category = create(:category)
    user = create(:user)
    login_as user.email
    
    visit home_path
    click_link t("menu.add_question")

    fill_in label("question.title"), with: "Some generic question"
    fill_in label("question.content"), with: "Some awesome question content"
    select category.name, from: label("question.category")
    click_button t("helpers.submit.question.create")

    expect(current_path).to match(%r[/perguntas/\d+])
    expect(page).to have_content(notice("questions.create"))
    expect(page).to have_content("Some generic question")
  end

  scenario "with invalid data" do
    category = create(:category)
    user = create(:user)
    login_as user.email
    
    visit home_path
    click_link t("menu.add_question")
    click_button t("helpers.submit.question.create")

    expect(current_path).to eql(new_question_path)
    expect(page).to have_content(t("form.error_message"))
  end
end