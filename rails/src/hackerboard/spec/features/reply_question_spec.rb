require "rails_helper"

feature "Reply questions" do
  scenario "with valid date" do
    user = create(:user)
    question = create(:question, user: user)
    login_as user.email

    visit home_path
    click_link question.title
    fill_in label("reply.content"), with: "Some reply"
    click_button t("helpers.submit.reply.create")

    expect(current_path).to eql(question_path(question))
    expect(page).to have_content(notice("replies.create"))
  end

  scenario "with invalid date" do
    user = create(:user)
    question = create(:question, user: user)
    login_as user.email
    
    # error_message = t("errors")[:messages][:blank]
    error_message = t("errors.messages.blank") #rails-i18n

    visit home_path
    click_link question.title
    click_button t("helpers.submit.reply.create")

    expect(current_path).to eql(question_path(question))
    expect(page).to have_content(error_message)
  end

  scenario "when unlogged" do
    question = create(:question)
    translation = ApplicationController.helpers.strip_tags(
      t("reply.you_must_be_logged_in_html", url: login_path)
    )

    visit home_path
    click_link question.title

    expect(page).to have_text(translation)
  end
end