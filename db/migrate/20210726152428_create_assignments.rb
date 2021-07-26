class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :mechanic, null: false, foreign_key: true
      t.references :ride, null: false, foreign_key: true
    end
  end
end
