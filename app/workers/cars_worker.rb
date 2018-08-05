class CarsWorker
  include Sidekiq::Worker

  def perform(driver_id)
    # some contrived work...
    driver             = Driver.find driver_id
    car                = driver.car
    new_driver_changes = car.driver_changes + 1
    car.update_attribute(:driver_changes, new_driver_changes)

    car_drivers = car.drivers_list
    ActionCable.server.broadcast('cars', drivers: car_drivers, car_id: car.id, driver_changes: new_driver_changes)
  end
end
