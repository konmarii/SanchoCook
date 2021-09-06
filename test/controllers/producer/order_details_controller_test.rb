require 'test_helper'

class Producer::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get producer_order_details_update_url
    assert_response :success
  end

end
