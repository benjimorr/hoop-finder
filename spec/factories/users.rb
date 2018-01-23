FactoryBot.define do
    pw = "mypassword"

    factory :user do
        sequence(:email){ |n| "user#{n}@factory.com" }
        sequence(:username){ |n| "user#{n}" }
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        password pw
        password_confirmation pw
    end
end
