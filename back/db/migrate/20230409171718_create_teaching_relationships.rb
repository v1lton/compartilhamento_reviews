class CreateTeachingRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :teaching_relationships do |t|
      t.integer :user_id
      t.integer :professor_id

      t.timestamps
    end
  end
end
