require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  subject { CarsPage.new }

  test "visiting the index" do
    subject.visit_page

    assert_selector "h1", text: "Cars"
  end

  # test "creating a Car" do
  #   visit cars_url
  #   click_on "New Car"
  #
  #   fill_in "Color", with: @car.color
  #   fill_in "Make", with: @car.make
  #   fill_in "Model", with: @car.model
  #   fill_in "Name", with: @car.name
  #   click_on "Create Car"
  #
  #   assert_text "Car was successfully created"
  #   click_on "Back"
  # end
  #
  # test "updating a Car" do
  #   visit cars_url
  #   click_on "Edit", match: :first
  #
  #   fill_in "Color", with: @car.color
  #   fill_in "Make", with: @car.make
  #   fill_in "Model", with: @car.model
  #   fill_in "Name", with: @car.name
  #   click_on "Update Car"
  #
  #   assert_text "Car was successfully updated"
  #   click_on "Back"
  # end
end
