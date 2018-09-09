RSpec.describe CarsWorker, type: :worker do
  let(:driver) { create(:driver) }
  let(:car) { driver.car }

  it 'performs a job' do
    expect { described_class.perform_async(driver.id) }.to change(described_class.jobs, :size).by(1)
  end

  it 'updates the driver changes' do
    Sidekiq::Testing.inline! do
      expect do
        described_class.perform_async(driver.id)
        car.reload
      end.to change(car, :driver_changes).by(1)
    end
  end

  it 'broadcasts on cars channel' do
    Sidekiq::Testing.inline! do
      new_driver_changes = car.driver_changes + 1
      broadcast_message  = { drivers: car.drivers_list, car_id: car.id, driver_changes: new_driver_changes }

      expect do
        described_class.perform_async(driver.id)
      end.to have_broadcasted_to('cars').with(broadcast_message)
    end
  end
end