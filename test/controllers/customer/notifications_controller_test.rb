require 'test_helper'

class Customer::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_notifications_index_url
    assert_response :success
  end
end
