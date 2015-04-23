FactoryGirl.define do
  factory :company do
    name    { Faker::Company.name }
    address { Faker::Address.street_address }
    city    { Faker::Address.city }
    country { Faker::Address.country }
  end
end
