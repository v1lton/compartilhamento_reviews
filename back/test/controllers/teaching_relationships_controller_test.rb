require "test_helper"

class TeachingRelationshipsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:joao)
    @professor = professors(:one)

    # Logs in user
    post login_path, params: { session: { username: @user.username, password: "password" } }
  end

  test "should create teaching relationship" do
    assert_difference('TeachingRelationship.count') do
      post teaching_relationships_path, params: { professor_id: @professor.id }
    end
    assert @user.is_professor?(@professor)
  end

  test "should delete teaching relationship" do
    @user.add_professor(@professor)
    assert @user.is_professor?(@professor)

    assert_difference('TeachingRelationship.count', -1) do
      delete teaching_relationship_url(@professor)
    end

    assert_not @user.is_professor?(@professor)
  end
end
