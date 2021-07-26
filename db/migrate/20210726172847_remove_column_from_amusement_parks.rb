class RemoveColumnFromAmusementParks < ActiveRecord::Migration[5.2]
  def change
    remove_column :amusement_parks, :ride_id
  end
end
