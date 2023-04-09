require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categories_url
    assert_response :success
    assert response.parsed_body.count, 2
    assert_equal response.parsed_body.first["name"], "ESS"
    assert_equal response.parsed_body.last["name"], "ESS3"
  end
end
