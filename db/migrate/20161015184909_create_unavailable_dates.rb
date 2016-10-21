class CreateUnavailableDates < ActiveRecord::Migration[5.0]
  def change
    create_table :unavailable_dates do |t|
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
