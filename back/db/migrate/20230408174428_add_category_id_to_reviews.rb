class AddCategoryIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :category_id, :integer
  end
end
