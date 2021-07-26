class CreateAmusementPark < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_parks do |t|
      t.string :name
      t.integer :price_of_admission

      t.timestamps
    end
  end
end
