FactoryGirl.define do
  factory :item do
    sequence(:name, 1) { |n| "item_#{n}" }
    category
  end
end
