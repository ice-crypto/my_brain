class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.text :body
      t.date :question_at
      t.json :categories
      t.json :answers

      t.timestamps
    end
  end
end
