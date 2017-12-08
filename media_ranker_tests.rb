require 'minitest/spec'
require 'minitest/autorun'
# run "gem install minitest-hooks" - this gives us before and after :all
require 'minitest/hooks/default'
require 'selenium-webdriver'

describe "Media Ranker" do

  before(:all) do
    @driver = Selenium::WebDriver.for :firefox
  end

  after(:all) do
    @driver.quit
  end

  before do
    media_ranker_url = "http://media-ranker-2-0.herokuapp.com/"
    @driver.navigate.to media_ranker_url
    # slow things down so we can see what's happening.
    sleep 3
  end

  it "should show the correct header text" do
    expected_header_text = "Media Ranker Ranking the Best of Everything"
    # Use CSS to locate the elements.
    element = @driver.find_element(:css, '.columns.small-12')
    assert_equal(expected_header_text, element.text)
  end

  it "should go to the correct url when the 'View all media' button is clicked" do
    expected_url = "http://media-ranker-2-0.herokuapp.com/works"
    @driver.find_element(:link_text, 'View all media').click
    puts @driver.current_url
    assert_equal(expected_url, @driver.current_url)
  end

  it "should successfully log an existing user in" do
    login_button = @driver.find_element(:css, "[href='/login']")
    login_button.click

    # there's a timing issue, if the script moves too fast the username element
    # may not be present. In live-coding, we added a 2 second sleep
    # which works but is an unreliable way way to fix it.
    # comment to demonstrate a more robust way to do it.
    # sleep 2
    # A more robust way is to wait for the element to be present:
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.find_element(:id, 'username') }

    username_input = @driver.find_element(:id, 'username')

    username_input.send_keys 'dan'
    login_submit_button = @driver.find_element(:css, "[value='Log In']")
    login_submit_button.click
    success_message = @driver.find_element(:class, 'success')
    assert_equal("Successfully logged in as existing user dan", success_message.text)
  end

  # Other possible scenarios we didn't get to in live-coding.
  #
  # it "should successfully add a new work" do
  #   assert(false)
  # end
  #
  # it "should prevent adding a work with no title" do
  #   assert(false)
  # end
  #
  # it "should allow us to edit the spotlight entry" do
  #   assert(false)
  # end

end

# don't forget to break your tests to prove they work.
