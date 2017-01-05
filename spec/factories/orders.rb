FactoryGirl.define do

  factory :order do
    sequence :total_cost [11.50,25.25,67.99,89.45,55.33,9.01].cycle do |n|
      n
    end

    # factory :order_with_items do
    #   transient do
    #     items_count 2
    #   end
    # end
  end
end