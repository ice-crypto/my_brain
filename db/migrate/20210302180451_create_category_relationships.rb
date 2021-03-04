class CreateCategoryRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :category_relationships do |t|
      t.references :category, foreign_key: true
      t.references :child, foreign_key: {to_table: :categories}

      t.timestamps
      t.index [:category_id, :child_id], unique: true
    end
  end
end
