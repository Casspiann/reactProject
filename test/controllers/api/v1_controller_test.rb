require "test_helper"

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get api_v1_home_url
    assert_response :success
  end
end
