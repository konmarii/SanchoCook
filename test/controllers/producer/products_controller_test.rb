require 'test_helper'

class Producer::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producer_products_index_url
    assert_response :success
  end

  test "should get show" do
    get producer_products_show_url
    assert_response :success
  end

  test "should get new" do
    get producer_products_new_url
    assert_response :success
  end

  test "should get create" do
    get producer_products_create_url
    assert_response :success
  end

  test "should get edit" do
    get producer_products_edit_url
    assert_response :success
  end

  test "should get update" do
    get producer_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get producer_products_destroy_url
    assert_response :success
  end

end
