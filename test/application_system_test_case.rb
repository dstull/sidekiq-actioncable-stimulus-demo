require "test_helper"
require 'selenium-webdriver'
require 'capybara'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  ENV['RAILS_SYSTEM_TESTING_SCREENSHOT'] = 'inline'

  Capybara.register_driver :headless_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
                                                              chromeOptions: { args: %w[no-sandbox headless disable-gpu window-size=1400,1400]}
    )

    Capybara::Selenium::Driver.new(
                                app,
                                browser: :chrome,
                                desired_capabilities: capabilities
    )
  end

  driven_by :headless_chrome
end
