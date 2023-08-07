FactoryBot.define do
  factory :group do
    name { Faker::Lorem.unique.word }
    icon { 'figma.png' }
    user
  end
end
