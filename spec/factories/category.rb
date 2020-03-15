FactoryBot.define do
  factory :category do
    name { "Car" }
    description { FFaker::Lorem.sentence }
  end
end