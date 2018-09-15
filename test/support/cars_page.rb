class CarsPage
  include Capybara::DSL
  include FactoryBot::Syntax::Methods
  include Rails.application.routes.url_helpers

  attr_reader :car

  def initialize
    @car = create(:car)
  end

  def visit_page
    visit cars_path
    sleep 1 # allow action cable to finish connecting
    self
  end

  def add_driver
    @added_driver = create(:driver,car: car)
    self
  end

  def remove_driver
    @added_driver.destroy
    self
  end

  def change_driver
    @added_driver.update_attribute(:name,'test_change')
    self
  end
end