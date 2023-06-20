require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_create_url
    assert_response :success
  end

  test "should get update" do
    get user_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_destroy_url
    assert_response :success
  end

  test "should get user_params" do
    get user_user_params_url
    assert_response :success
  end
end
