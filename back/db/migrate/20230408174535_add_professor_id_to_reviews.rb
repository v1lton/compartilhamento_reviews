class AddProfessorIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :professor_id, :integer
  end
end
