FactoryGirl.define do
  factory :position do
    sequence(:name) { |n| "position-no-#{n}" }

    trait :director do
      name 'Director'
    end

    trait :beneficial_owner do
      name 'Beneficial Owner'
    end
  end
end
