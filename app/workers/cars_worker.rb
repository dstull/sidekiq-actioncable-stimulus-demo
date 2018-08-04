class CarsWorker
  include Sidekiq::Worker

  def perform(driver_id)
    # some contrived work...
    driver             = Driver.find driver_id
    car                = driver.car
    new_driver_changes = car.driver_changes + 1
    car.update_attribute(:driver_changes, new_driver_changes)
  end
end
