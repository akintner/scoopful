FactoryGirl.define do
  factory :item do
    name { Faker::Food.ingredient }
    description { Faker::Hipster.sentence }
    image_url "https://media1.popsugar-assets.com/files/thumbor/xnzOM9QwkBflYeto0P44X7P7gb8/fit-in/550x550/filters:format_auto-!!-:strip_icc-!!-/2013/04/16/1/192/1922195/42aad48fd568b590_Bulk-Aisle.jpg"
    price_per_unit { Faker::Number.decimal(2, 2) }
  end
end