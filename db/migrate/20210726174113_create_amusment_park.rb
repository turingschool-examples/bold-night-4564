class CreateAmusmentPark < ActiveRecord::Migration[5.2]
  def change
    create_table :amusment_parks do |t|
      t.string :name
      t.integer :price_of_admission
      t.references :ride, foreign_key: true

      t.timestamps
    end
  end
end
