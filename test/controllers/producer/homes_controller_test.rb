require 'test_helper'

class Producer::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get producer_homes_top_url
    assert_response :success
  end

end
