FactoryBot.define do
  factory :product do
    name { Faker::Lorem.unique.word }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    association :author, factory: :user

    association :group, factory: :group
  end
end
