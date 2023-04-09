require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:lorem)
    @category = categories(:one)
  end
  
  test "find category" do
    get reviews_by_category_url, params: { category_name: "ESS" }

    assert_response :success
    assert_equal 1, response.parsed_body.count
    assert_equal @review.description, response.parsed_body.first["review_content"]
  end

  test "find category not found" do
    get reviews_by_category_url, params: { category_name: "ESS2" }

    assert_response :not_found
    assert_equal "Category not found.", response.parsed_body["message"]
  end

  test "empty category" do
    get reviews_by_category_url, params: { category_name: "ESS3" }

    assert_response :success
    assert_equal 0, response.parsed_body.count
  end
end