require "test_helper"

class Api::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get api_reviews_show_url
    assert_response :success
  end

  test "should get create" do
    get api_reviews_create_url
    assert_response :success
  end

  test "should get update" do
    get api_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_reviews_destroy_url
    assert_response :success
  end

  test "should get review_params" do
    get api_reviews_review_params_url
    assert_response :success
  end
end
