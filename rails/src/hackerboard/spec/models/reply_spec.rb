require "rails_helper"

describe Reply do
  describe "validations" do
    it "requires user" do
      reply = Reply.create(user: nil)
      expect(reply.errors[:user]).not_to be_empty
    end

    it "requires question" do
      reply = Reply.create(question: nil)
      expect(reply.errors[:question]).not_to be_empty
    end

    it "requires content" do
      reply = Reply.create(content: nil)
      expect(reply.errors[:content]).not_to be_empty
    end
  end
end