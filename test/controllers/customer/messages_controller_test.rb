require 'test_helper'

class Customer::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_messages_show_url
    assert_response :success
  end

  test "should get create" do
    get customer_messages_create_url
    assert_response :success
  end
end
