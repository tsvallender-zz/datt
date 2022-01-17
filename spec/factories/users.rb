FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at { Time.now }
  end

  factory :note do
    title { Faker::Science.element }
    content { Faker::Science.modifier + ' ' + 
              Faker::Games::DnD.monster }
    user
  end

  factory :todo do
    title { Faker::Science.element }
    content { Faker::Science.modifier + ' ' + 
              Faker::Games::DnD.monster }
    due_date { Faker::Date.forward days: 30 }
    done { Faker::Boolean.boolean }
    user
  end
end
