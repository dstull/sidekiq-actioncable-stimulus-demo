RSpec.describe CarsWorker, type: :worker do
  let(:driver) { create(:driver) }

  it 'performs a job' do
    expect { described_class.perform_async(driver.id) }.to change(described_class.jobs, :size).by(1)
  end

  it 'updates the driver changes' do
    car = driver.car

    Sidekiq::Testing.inline! do
      expect do
        described_class.perform_async(driver.id)
        car.reload
      end.to change(car, :driver_changes).by(1)
    end
  end
end