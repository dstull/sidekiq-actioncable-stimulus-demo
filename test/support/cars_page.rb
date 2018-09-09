class CarsPage
  include Capybara::DSL
  include FactoryBot::Syntax::Methods
  include Rails.application.routes.url_helpers

  def initialize
    @car = create(:car)
  end

  def visit_page
    visit cars_path
    self
  end
end