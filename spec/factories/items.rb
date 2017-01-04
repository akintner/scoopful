FactoryGirl.define do
  factory :item do
    name { Faker::Food.ingredient }
    description { Faker::Hipster.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'grapes.png')) } 
    price_per_unit { Faker::Number.decimal(1, 2) }
    category
  end
end