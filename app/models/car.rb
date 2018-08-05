class Car < ApplicationRecord
  has_many :drivers, dependent: :destroy

  after_touch :update_driver_names

  def drivers_list
    drivers.pluck(:name).join(',')
  end

  private

  def update_driver_names
    CarsWorker.perform_async(id)
  end
end
