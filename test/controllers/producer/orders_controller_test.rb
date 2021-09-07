require 'test_helper'

class Producer::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producer_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get producer_orders_show_url
    assert_response :success
  end

  test "should get new" do
    get producer_orders_new_url
    assert_response :success
  end

  test "should get update" do
    get producer_orders_update_url
    assert_response :success
  end

end
