# to get started: install selenium-webdriver gem
# gem install selenium-webdriver
# download geckodriver (geckodriver-v0.19.1-macos.tar.gz)
# from https://github.com/mozilla/geckodriver/releases
# and unzip it and place the binary file in /usr/local/bin

# This is the basic intro script from the official site.
# https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings

require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit


# Improvement #1
# if you want to wait for the search to load?
# wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# wait.until { driver.title.start_with? "Hello WebDriver!" }

# Improvement #2
# Click on the first result.

# If using Google Chrome, the driver always quits when the script completes so
# you have to configure it to stay open.
#   caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" =>  {'detach' => true})
#   driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
