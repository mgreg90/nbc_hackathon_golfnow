require 'test_helper'

class ApiDotAiControllerTest < ActionDispatch::IntegrationTest
  test "should get action_handler" do
    get api_dot_ai_action_handler_url
    assert_response :success
  end

end
