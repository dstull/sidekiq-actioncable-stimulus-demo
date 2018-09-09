require 'faker'

FactoryBot.define do
  factory :car do
    name { Faker::RockBand.unique.name }
    make { Faker::Company.name }
    color { Faker::Color.color_name }
    model { Faker::Device.model_name }

    trait :with_driver do
      after(:create) do |car|
        create_list(:driver, 5, car: car)
      end
    end
  end
end