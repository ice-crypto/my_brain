class CreateFormats < ActiveRecord::Migration[6.1]
  def change
    create_table :formats do |t|
      t.integer :problem_type

      t.timestamps
    end
  end
end
