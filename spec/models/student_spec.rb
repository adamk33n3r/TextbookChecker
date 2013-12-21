require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  #let(:user) { User.new(email: "john_doe@taylor.edu", password: "password", password_confirmation: "password") }
  subject { user }
  
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }

  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
  
  describe "with empty username" do
    before { user.username = '' }
    it { should be_valid }
  end
  
  describe "with blank username" do
    before { user.username = ' ' }
    it { should be_valid }
  end

  describe "with empty email" do
    before { user.email = '' }
    it { should_not be_valid }
  end

  describe "with blank email" do
    before { user.email = ' ' }
    it { should_not be_valid }
  end

  describe "with long email name" do
    before { user.email = "z_" * 13 + "@taylor.edu" }
    it { should_not be_valid }
  end
  
end