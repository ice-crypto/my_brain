class CreateAuthorsBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :authors_books do |t|
      t.references :author
      t.references :book

      t.timestamps
    end
  end
end
