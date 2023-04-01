require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:joao)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
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

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end
end
