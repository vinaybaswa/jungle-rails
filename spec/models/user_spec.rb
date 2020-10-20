require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
        described_class.new(
          name: "John",
          password: "some_password", 
          password_confirmation: "some_password",
          email: "john@doe.com"
        )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid signup with non-matching passwords" do
      subject.password_confirmation = "not_some_password"
      expect(subject).to_not be_valid
    end

    it "should have a password with minimum lenght 8 characters" do
      subject.password = "1234567"
      subject.password_confirmation = "1234567"
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should log the user in if the credentials are correct' do
      user = User.new(name: "John", email: "jimmy@gmail.com", password: "12345678", password_confirmation: "12345678")
      user.save!
      expect(User.authenticate_with_credentials("jimmy@gmail.com", "12345678")).to be_present
    end
    it 'should log the user in if the credentials are correct but caps are on' do
      user = User.new(name: "John", email: "jiMmy@gmail.com", password: "12345678", password_confirmation: "12345678")
      user.save!
      expect(User.authenticate_with_credentials("jimmy@gmail.com", "12345678")).to be_present
    end
    it 'should log the user in if the credentials are correct but there are spaces after email' do
      user = User.new(name: "John", email: "jimmy@gmail.com", password: "12345678", password_confirmation: "12345678")
      user.save!
      expect(User.authenticate_with_credentials("jimmy@gmail.com  ", "12345678")).to be_present
    end
  end
end
