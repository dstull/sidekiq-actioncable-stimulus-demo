class CarsWorker
  include Sidekiq::Worker

  def perform(car_id)
    # some contrived work...
    car                = Car.find car_id
    new_driver_changes = car.driver_changes + 1
    car.update_attribute(:driver_changes, new_driver_changes)

    car_drivers = car.drivers_list
    ActionCable.server.broadcast('cars', drivers: car_drivers, car_id: car_id, driver_changes: new_driver_changes)
  end
end
