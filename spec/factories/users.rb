FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "example" }
    password_confirmation { "example" }
    confirmed_at { Time.now }
  end
end