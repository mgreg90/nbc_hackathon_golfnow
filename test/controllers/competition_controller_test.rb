require 'test_helper'

class CompetitionControllerTest < ActionDispatch::IntegrationTest
  test "should get get_competitions" do
    get competition_get_competitions_url
    assert_response :success
  end

end
