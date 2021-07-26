class AddRidesToAmusementPark < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :amusement_parks, foreign_key: true
  end
end
