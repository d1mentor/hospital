require "test_helper"

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get doctors_profile_url
    assert_response :success
  end
end
