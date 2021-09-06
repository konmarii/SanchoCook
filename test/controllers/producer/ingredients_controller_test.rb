require 'test_helper'

class Producer::IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get producer_ingredients_create_url
    assert_response :success
  end

  test "should get edit" do
    get producer_ingredients_edit_url
    assert_response :success
  end

  test "should get update" do
    get producer_ingredients_update_url
    assert_response :success
  end

  test "should get destroy" do
    get producer_ingredients_destroy_url
    assert_response :success
  end

end
