class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :thrill_rating
      t.boolean :open, default: true, null: false

      t.timestamps
    end
  end
end
