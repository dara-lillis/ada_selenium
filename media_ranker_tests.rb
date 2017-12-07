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
    assert_equal(expected_url, @driver.current_url)
  end

  # it "should successfully add a new work" do
  #   assert(false)
  # end
  #
  # it "should prevent adding a work with no title" do
  #   assert(false)
  # end
  #
  # it "should successfully log an existing user in" do
  #   assert(false)
  # end
  #
  # it "should allow us to edit the spotlight entry" do
  #   assert(false)
  # end

end

# don't forget to break your tests to prove they work.
#
