# to get started: install selenium-webdriver gem
# gem install selenium-webdriver
# download geckodriver (geckodriver-v0.19.1-macos.tar.gz)
# from https://github.com/mozilla/geckodriver/releases
# and unzip it and place the binary file in /usr/local/bin
#
# This is the basic intro script from the official site.
# https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings

require "selenium-webdriver"

# If using Google Chrome, the driver always quits when the script completes so
# you have to configure it to stay open if you want to look at the browser
# after the test completes.
# caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" =>  {'detach' => true})
# driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps

# Start a Firefox browser session.
driver = Selenium::WebDriver.for :firefox

# Go to the google home page.
driver.navigate.to "http://google.com"

# Uncomment the sleeps if you want to follow the script running.
# Without the sleeps, it will run so fast you may not see what it's doing.

# sleep 2
# locate the search input.
element = driver.find_element(name: 'q')
# sleep 2
# Enter a search string
element.send_keys "Hello WebDriver!"
# sleep 2
# submit the search (do a "submit" action on the element)
element.submit
# sleep 2

# Wait for the search to load, by waiting for the page title to
# include our search term.
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.start_with? "Hello WebDriver!" }

puts driver.title

# Click on the link for the first search result.
# Add a sleep to ensure the link is loaded
# This is not the best way to write a robust script, but fine for a quick demo.
sleep 2
first_search_result = driver.find_element(css: 'div.rc > h3.r > a')
first_search_result.click

# Close the browser session.
# driver.quit


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
