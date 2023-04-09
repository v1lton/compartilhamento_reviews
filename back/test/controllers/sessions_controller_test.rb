require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:joao)

    # Logs in user
    post login_path, params: { session: { username: @user.username, password: "password" } }
  end

  test "should get logged_user" do
    get logged_user_url, as: :json
    assert_response :success
    assert_equal @user.username, response.parsed_body["username"]
  end

  test "should update logged_user" do
    body = {
      "user":
        {
          "email": "newemail@test.com",
          "pronouns": "They/Them",
          "country": "United States"
        }
    }

    patch update_logged_user_url, params: body, as: :json
    @user.reload

    assert_response :success
    assert_equal body[:user][:email], @user.email
    assert_equal body[:user][:pronouns], @user.pronouns
    assert_equal body[:user][:country], @user.country
  end

  test "should not update logged_user with invalid params" do
    body = {
      "user":
        {
          "email": "",
          "pronouns": "invalid pronouns",
          "country": "invalid country"
        }
    }

    patch update_logged_user_url, params: body, as: :json

    assert_response :unprocessable_entity
  end

  test "should log in user with valid credentials" do
    post login_path, params: { session: { username: @user.username, password: "password" } }, as: :json

    assert_response :success
    assert_equal @user.username, response.parsed_body["username"]
  end

  test "should not log in user with invalid username" do
    post login_path, params: { session: { username: "invalid_username", password: "password" } }, as: :json

    assert_response :not_found
    assert_equal "Invalid email/password combination", response.parsed_body["message"]
  end

  test "should not log in user with invalid password" do
    post login_path, params: { session: { username: @user.username, password: "invalid_password" } }, as: :json

    assert_response :not_found
    assert_equal "Invalid email/password combination", response.parsed_body["message"]
  end

  test "should log out user" do
    delete logout_url, as: :json

    assert_response :accepted
  end

  test "should return logged status when user is logged in" do
    get is_logged_url, as: :json

    assert_response :accepted
    assert_equal true, response.parsed_body["logged"]
  end

  test "should return logged status when user is not logged in" do
    log_out
    get is_logged_url, as: :json

    assert_response :not_found
    assert_equal false, response.parsed_body["logged"]
  end

  private

  def log_out
    delete logout_path
  end
end
