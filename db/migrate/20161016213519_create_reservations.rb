class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :cost
      t.references :guide, foreign_key: true
      t.references :traveler, foreign_key: true
      t.string :language
      t.string :location

      t.timestamps
    end
  end
end
