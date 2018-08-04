class Driver < ApplicationRecord
  belongs_to :car

  after_update :update_driver_changes

  delegate :name, to: :car, prefix: true

  private

  def update_driver_changes
    CarsWorker.perform_async(id)
  end
end