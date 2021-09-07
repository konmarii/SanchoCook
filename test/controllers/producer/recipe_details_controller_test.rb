require 'test_helper'

class Producer::RecipeDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get producer_recipe_details_create_url
    assert_response :success
  end

  test "should get edit" do
    get producer_recipe_details_edit_url
    assert_response :success
  end

  test "should get update" do
    get producer_recipe_details_update_url
    assert_response :success
  end

  test "should get destroy" do
    get producer_recipe_details_destroy_url
    assert_response :success
  end

end
