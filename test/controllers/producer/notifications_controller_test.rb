require 'test_helper'

class Producer::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producer_notifications_index_url
    assert_response :success
  end
end
