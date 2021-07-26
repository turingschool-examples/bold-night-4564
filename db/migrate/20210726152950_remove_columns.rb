class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :mechanics_id
  end
end
