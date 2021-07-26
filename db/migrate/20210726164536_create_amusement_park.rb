class CreateAmusementPark < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_parks do |t|
      t.string :name
      t.float :price_of_admissions

      t.timestamps
    end
  end
end
