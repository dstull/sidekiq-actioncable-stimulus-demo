require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    # rspec needs test setting and system tests need async
    ActionCable::Server::Base.config.cable = { 'adapter' => 'async' }
  end

  teardown do
    ActionCable::Server::Base.config.cable = { 'adapter' => 'test' }
  end

  subject { CarsPage.new }

  test "visiting the index" do
    subject.visit_page

    assert_selector "h1", text: "Cars"
  end

  test 'driver is added to car and then deleted' do
    subject.visit_page

    assert_equal subject.car.drivers_list, find("tr#car_id_#{subject.car.id} td.cars--drivers").text

    Sidekiq::Testing.inline! do
      subject.add_driver
    end

    assert_equal subject.car.reload.drivers_list, find("tr#car_id_#{subject.car.id} td.cars--drivers").text

    Sidekiq::Testing.inline! do
      subject.remove_driver
    end

    assert_equal subject.car.drivers_list, find("tr#car_id_#{subject.car.id} td.cars--drivers").text
  end

  test 'driver name is changed' do
    subject.add_driver.visit_page
    sleep 1

    assert_equal subject.car.drivers_list, find("tr#car_id_#{subject.car.id} td.cars--drivers").text

    Sidekiq::Testing.inline! do
      subject.change_driver
    end

    assert_equal subject.car.drivers_list, find("tr#car_id_#{subject.car.id} td.cars--drivers").text
  end
end
