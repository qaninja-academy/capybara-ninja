require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL
end

Capybara.register_driver :selenium_chrome do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << '--disable-site-isolation-trials'
    # Sets the minimum log level. Valid values are from 0 to 3: INFO = 0, WARNING = 1, LOG_ERROR = 2, LOG_FATAL = 3.
    opts.args << '--log-level=3'
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 15
end
