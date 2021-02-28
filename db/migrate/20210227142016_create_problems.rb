class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.text :body
      t.json :categories
      t.date :question_at

      t.timestamps
    end
  end
end
