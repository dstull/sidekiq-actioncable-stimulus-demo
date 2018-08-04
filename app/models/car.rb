class Car < ApplicationRecord
  has_many :drivers, dependent: :destroy

  after_touch :update_driver_names

  private

  def update_driver_names
    CarsWorker.perform_async(id)
  end
end
