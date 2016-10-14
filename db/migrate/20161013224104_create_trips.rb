class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.references :guide, foreign_key: true
      t.references :traveler, foreign_key: true
      t.string :location
      t.string :interests
      t.text :requests

      t.timestamps
    end
  end
end
