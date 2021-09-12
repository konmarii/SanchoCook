require 'test_helper'

class Customer::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_recipes_show_url
    assert_response :success
  end

end
