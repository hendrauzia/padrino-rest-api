FactoryGirl.define do
  factory :employee do
    name     { Faker::Name.name }
    position
    company

    trait :director do
      position { Position.find_or_create_by( name: 'Director' ) }
    end

    trait :beneficial_owner do
      position { Position.find_or_create_by( name: 'Beneficial Owner' ) }
    end
  end
end
