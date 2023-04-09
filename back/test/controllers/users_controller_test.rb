require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:joao)
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

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end
end
