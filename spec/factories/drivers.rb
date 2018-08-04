require 'faker'

FactoryBot.define do
  factory :driver do
    association :car, factory: :car, strategy: :build
    name { Faker::Name.name }
  end
end