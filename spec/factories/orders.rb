FactoryGirl.define do

  factory :order do
    user

    factory :order_with_items do
      transient do
        items_count 2
      end
    end
  end
end