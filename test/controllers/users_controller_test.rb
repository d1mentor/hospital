require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get doctors_list" do
    get users_doctors_list_url
    assert_response :success
  end

  test "should get profile" do
    get users_profile_url
    assert_response :success
  end
end
