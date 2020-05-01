require "rails_helper"

describe Question do
  describe "validations" do
    it "requires title" do
      question = Question.create(title: nil)
      expect(question.errors[:title]).not_to be_empty
    end

    it "requires content" do
      question = Question.create(content: nil)
      expect(question.errors[:content]).not_to be_empty
    end

    it "requires category" do
      question = Question.create(category: nil)
      expect(question.errors[:category]).not_to be_empty
    end

    it "requires user" do
      question = Question.create(user: nil)
      expect(question.errors[:user]).not_to be_empty
    end
  end
end