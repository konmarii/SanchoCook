require 'test_helper'

class Customer::RecipeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customer_recipe_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_recipe_comments_destroy_url
    assert_response :success
  end

end
