class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :key
      t.boolean :root, default: false
      t.integer :group

      t.timestamps
    end
  end
end
