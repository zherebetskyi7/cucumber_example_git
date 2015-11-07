require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'

Capybara.default_driver = :chrome
      Selenium::WebDriver::Chrome::Service.executable_path = '/usr/local/bin/chromedriver' # specify the path of chromedriver

          Capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(app, :browser => :chrome)
          end
