FactoryGirl.define do

  factory :orders_item do
    order
    item
    current_price_per_unit 1.99
    quantity 1
  end

end