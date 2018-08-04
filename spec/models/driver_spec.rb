RSpec.describe Driver do
  context 'after_update' do
    let(:driver) { create(:driver) }

    it 'updates the driver changes' do
      car = driver.car

      Sidekiq::Testing.inline! do
        expect do
          driver.update_attribute(:name,'test_driver')
          car.reload
        end.to change(car, :driver_changes).by(1)
      end
    end
  end
end