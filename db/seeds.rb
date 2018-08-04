# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times.each do
  car = Car.create(name: Faker::RockBand.unique.name,
             make: Faker::Company.name,
             color: Faker::Color.color_name,
             model: Faker::Device.model_name)
  5.times.each do
    Driver.create(name: Faker::Name.name,car_id: car.id)
  end
end