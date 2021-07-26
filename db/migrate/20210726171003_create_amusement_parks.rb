class CreateAmusementParks < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_parks do |t|
      t.string :name
      t.decimal :price, precision: 4, scale: 2

      t.timestamps
    end
  end
end
