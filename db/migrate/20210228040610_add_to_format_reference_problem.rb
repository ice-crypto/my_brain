class AddToFormatReferenceProblem < ActiveRecord::Migration[6.1]
  def change
    add_reference :problems, :format, foreign_key: true
  end
end
