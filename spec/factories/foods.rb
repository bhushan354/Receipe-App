FactoryBot.define do
  factory :food do
    name { 'Apple' }
    measurement_unit { 'grams' }
    price { 1.0 }
    quantity { 100 }
    association :user
  end
end
