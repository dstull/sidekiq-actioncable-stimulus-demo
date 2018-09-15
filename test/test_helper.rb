require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rspec'
require 'capybara/rails'
require 'minitest/spec'
require 'sidekiq/testing'

Dir[Rails.root.join("test/support/**/*.rb")].sort.each { |f| require f }
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  extend MiniTest::Spec::DSL
end