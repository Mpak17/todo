FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@mail.com" }
    password { 'Password@123' }
  end
end
