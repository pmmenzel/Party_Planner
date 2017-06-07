require 'spec_helper'

describe User do
  it { should have_many :events}
  # it { should have_many :guestlists}
  # it { should_not have_many :items}
end

describe "User Count" do

  context "Empty Users Table " do
    it "should not have any users" do
      users =  User.all
      expect(users.length).to eq(0)
    end
  end
  context "Invalid Email" do
    it "should not create user" do
      users =  User.all
      user = User.create(email:"test", password:"12341234")
      expect(users.length).to eq(0)
    end
  end

  # context "User Info Valid" do
  #   it "should create user record" do
  #     users =  User.all
  #     user = User.create(email:"test@test.com", password:"12341234")
  #     expect(users.length).to eq(1)
  #   end
  # end
end
