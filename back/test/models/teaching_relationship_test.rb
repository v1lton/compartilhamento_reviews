require "test_helper"

class TeachingRelationshipTest < ActiveSupport::TestCase
  def setup
    @teaching_relationship = TeachingRelationship.new(user_id: 123, professor_id: 1234)
  end

  test "should require a user_id" do
    @teaching_relationship.user_id = nil
    assert_not @teaching_relationship.valid?
  end

  test "should require a professor_id" do
    @teaching_relationship.professor_id = nil
    assert_not @teaching_relationship.valid?
  end
end
