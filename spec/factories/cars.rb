require 'faker'

FactoryBot.define do
  factory :car do
    name { Faker::RockBand.unique.name }
    make { Faker::Company.name }
    color { Faker::Color.color_name }
    model { Faker::Device.model_name }
  end
end