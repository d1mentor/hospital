require "test_helper"

class CutawayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cutaway_index_url
    assert_response :success
  end
end
