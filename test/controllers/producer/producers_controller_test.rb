require 'test_helper'

class Producer::ProducersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_page" do
    get producer_producers_my_page_url
    assert_response :success
  end

  test "should get edit" do
    get producer_producers_edit_url
    assert_response :success
  end

  test "should get update" do
    get producer_producers_update_url
    assert_response :success
  end
end
