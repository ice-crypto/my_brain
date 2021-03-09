class AddProblemReferenceToPeriod < ActiveRecord::Migration[6.1]
  def change
    add_reference :problems, :period, foreign_key: true, default: 1
  end
end
