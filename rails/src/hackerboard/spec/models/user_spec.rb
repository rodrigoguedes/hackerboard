require "rails_helper"

describe User do
  describe "validations" do
    it "requires name" do
      user = User.create(name: nil)
      expect(user.errors[:name]).not_to be_empty
    end

    it "requires email" do
      user = User.create(email: nil)
      expect(user.errors[:email]).not_to be_empty
    end

    it "requires valid email" do
      user = User.create(email: "invalid")
      expect(user.errors[:email]).not_to be_empty
    end

    %w[
      john@example.org
      john.doe@example.org
      john.doe+spam@example.org
      john.doe@example.co.uk
      john.doe@example.com.br
      john.doe@example.info
      john.doe@example.io
      john1234@example.org
      1234.jd@example.org
      john-doe@example.org
      john_doe@example.org
    ].each do |email|
      it "accepts #{email} as valid emails" do
        user = User.create(email: email)
        expect(user.errors[:email]).to be_empty
      end
    end

    it "requires password" do
      user = User.create(password: nil)
      expect(user.errors[:password]).not_to be_empty
    end

    it "requires password confirmation" do
      user = User.create(password: "test", password_confirmation: "invalid")
      expect(user.errors[:password_confirmation]).not_to be_empty
    end

    it "requires unique email" do
      existing = User.create!(
        name: "John Doe", 
        email: "john@example.org", 
        password: "test", 
        password_confirmation: "test"
      )

      user = User.create(email: "John@example.org")
      expect(user.errors[:email]).not_to be_empty
    end
  end
end