require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:joao)

    # Logs in user
    post login_path, params: { session: { username: @user.username, password: "password" } }
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
    assert_equal User.all.count, response.parsed_body.count
  end

  test "should create user" do
    body = {
      "user":
        {
          "username": "v1ltoxdn",
          "email": "wrs@teste.com",
          "name": "Wilton",
          "surname": "Ramos de Oliveira",
          "pronouns": "Elu/Delu",
          "country": "Brasil",
          "password": "OCinÉDemais!",
          "password_confirmation": "OCinÉDemais!"
        }
    }

    assert_difference("User.count") do
      post users_url, params: body, as: :json
    end
    created_user = response.parsed_body

    assert_response :created
    assert_equal body[:user][:username], created_user["username"]
    assert_equal body[:user][:email], created_user["email"]
    assert_equal body[:user][:surname], created_user["surname"]
    assert_equal body[:user][:pronouns], created_user["pronouns"]
    assert_equal body[:user][:country], created_user["country"]
  end

  test "should not create user with invalid params" do
    body = {
      "user":
        {
          "username": "",
          "email": "invalid-email",
          "password": "short",
          "password_confirmation": "mismatch"
        }
    }

    assert_no_difference("User.count") do
      post users_url, params: body, as: :json
    end

    assert_response :unprocessable_entity
  end

  test "should show user" do
    get user_url(@user), as: :json

    assert_response :success
    assert_equal @user.username, response.parsed_body["username"]
    assert_equal @user.email, response.parsed_body["email"]
    assert_equal @user.surname, response.parsed_body["surname"]
    assert_equal @user.pronouns, response.parsed_body["pronouns"]
    assert_equal @user.country, response.parsed_body["country"]
  end

  test "should update user" do
    body = {
      "user":
        {
          "email": "newemail@test.com",
          "pronouns": "They/Them",
          "country": "United States"
        }
    }

    patch user_url(@user), params: body, as: :json
    @user.reload

    assert_response :success
    assert_equal body[:user][:email], @user.email
    assert_equal body[:user][:pronouns], @user.pronouns
    assert_equal body[:user][:country], @user.country
  end

  test "should not update user with invalid params" do
    body = {
      "user":
        {
          "email": ""
        }
    }

    patch user_url(@user), params: body, as: :json

    assert_response :unprocessable_entity
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end

  test "should not destroy user if not logged in" do
    log_out
    delete user_url(@user), as: :json

    assert_response :forbidden
  end

  test "should not destroy user if not correct user" do
    other_user = users(:rafa)
    delete user_url(other_user), as: :json

    assert_response :forbidden
  end

  def log_out
    delete logout_path
  end
end
