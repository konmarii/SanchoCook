require 'test_helper'

class Producer::ChartControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producer_chart_index_url
    assert_response :success
  end

end
