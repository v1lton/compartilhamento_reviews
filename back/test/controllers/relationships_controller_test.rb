require "test_helper"

class RelationshipsControllerTest < ActionController::TestCase
  def setup
    @user = users(:joao)
    @other_user = users(:rafa)

    # Logs in
    log_in_as(@user)
  end

  test "should create relationship" do
    assert_difference('Relationship.count') do
      post :create, params: { followed_id: @other_user.id }
    end
    assert @user.following?(@other_user)
  end

  test "should destroy relationship" do
    @user.follow(@other_user)
    assert @user.following?(@other_user)

    assert_difference('Relationship.count', -1) do
      delete :destroy, params: { id: @other_user.id }
    end

    assert_not @user.following?(@other_user)
  end
end