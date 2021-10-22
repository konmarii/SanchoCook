require 'test_helper'

class Customer::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_favorites_index_url
    assert_response :success
  end

  test "should get create" do
    get customer_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_favorites_destroy_url
    assert_response :success
  end
end
