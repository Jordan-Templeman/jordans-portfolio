# frozen_string_literal: true

module SystemTestDrivers
  def use_chrome
    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.load_selenium
      browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
        opts.args << '--window-size=1920,1080'
        opts.args << '--disable-site-isolation-trials'
      end
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
    end
    driven_by :selenium_chrome
  end

  def use_chrome_headless
    Capybara.register_driver :selenium_chrome_headless do |app|
      opts = Selenium::WebDriver::Chrome::Options.new

      chrome_args = %w[--headless --no-sandbox --disable-gpu --window-size=1920,1080 --remote-debugging-port=9222]
      chrome_args.each { |arg| opts.add_argument(arg) }
      Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: opts)
    end
    driven_by :selenium_chrome_headless
  end
end

RSpec.configure do |config|
  config.include SystemTestDrivers

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    use_chrome_headless
  end
end
