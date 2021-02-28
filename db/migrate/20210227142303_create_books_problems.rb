class CreateBooksProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :books_problems do |t|
      t.references :book
      t.references :problem

      t.timestamps
    end
  end
end
