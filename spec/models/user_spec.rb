require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.create(:password => "abcd", :password_confirmation => "abcd", :email => "123@gmail.com", :firstname => "Tlk", :lastname => "Tlk")
    end
    it "Is valid if password and password confirmation fields match" do
      expect(@user).to be_valid
    end
    it "Is not valid if password and password confirmation fields do not match" do
      @user.password = "abc"
      expect(@user).to_not be_valid
    end
    it "Is not valid if email field is blank" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "Is not valid if firstname field is blank" do
      @user.firstname = nil
      expect(@user).to_not be_valid
    end
    it "Is not valid if email field is blank" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "Is not valid if email already exists in db" do
      @duplicate = User.create(:password => "abcd", :password_confirmation => "abcd", :email => "123@gmail.com", :firstname => "Tlk", :lastname => "Tlk")
      expect(@duplicate).to_not be_valid

    end
    it "Is not valid if password is less than 4 characters" do
      @user.password = "ab"
      @user.password_confirmation = "ab"
      expect(@user).to_not be_valid
    end
  end
end

