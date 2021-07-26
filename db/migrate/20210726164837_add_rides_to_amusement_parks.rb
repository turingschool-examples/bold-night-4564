class AddRidesToAmusementParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :amusement_parks, :ride, foreign_key: true
  end
end
