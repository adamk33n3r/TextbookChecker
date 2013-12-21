FactoryGirl.define do
  factory :user do
    email    "john_doe@taylor.edu"
    password "password"
    password_confirmation "password"
  end
end