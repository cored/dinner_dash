FactoryGirl.define do
  factory :category do
    sequence(:name, 1) { |n| "category_#{n}" }
  end
end
