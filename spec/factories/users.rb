FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password 'password'
    sequence :email do |n| 
      Faker::Internet.email + "-#{n}"
    end
  end
end