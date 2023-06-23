require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get reviews_show_url
    assert_response :success
  end

  test "should get create" do
    get reviews_create_url
    assert_response :success
  end

  test "should get update" do
    get reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reviews_destroy_url
    assert_response :success
  end

  test "should get review_params" do
    get reviews_review_params_url
    assert_response :success
  end
end
