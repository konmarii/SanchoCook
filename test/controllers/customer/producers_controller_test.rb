require 'test_helper'

class Customer::ProducersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_producers_show_url
    assert_response :success
  end
end
