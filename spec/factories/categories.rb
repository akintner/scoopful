FactoryGirl.define do

  factory :category do
    sequence :title do |n|
      "#{n}-title"
    end

    factory :category_with_items do
      transient do
        items_count 2
      end

      after(:create) do |category, evaluator|
        create_list(:item, evaluator.items_count, category: category)
      end
    end

  end

end