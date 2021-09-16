require 'test_helper'

class Producer::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get producer_messages_show_url
    assert_response :success
  end

  test "should get create" do
    get producer_messages_create_url
    assert_response :success
  end

end
