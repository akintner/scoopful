FactoryGirl.define do

  factory :order do
    user
    
    factory :order_with_items do
      transient do
        items_count 2
      end
      after(:create) do |order, evaulator|
        create_list(:item, evaulator.items_count, order: order)
      end
    end
  end
end