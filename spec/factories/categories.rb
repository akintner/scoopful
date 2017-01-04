FactoryGirl.define do

  factory :category do
    sequence :title do |n|
      "#{n}-title"
    end
  end

end