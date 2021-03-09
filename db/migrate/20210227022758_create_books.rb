class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.json :categories
      t.date :published_at

      t.timestamps
    end
  end
end
