FactoryBot.define do
  factory :group_product do
    association :product
    association :group
  end
end
