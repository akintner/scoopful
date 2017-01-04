FactoryGirl.define do
  factory :item do
    name { Faker::Food.ingredient }
    description { Faker::Hipster.sentence }
    image_url { Faker::Fillmurray.image }
    price_per_unit { Faker::Number.decimal(2, 2) }
    # category nil
  end
end


