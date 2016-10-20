class AddStartDateToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :start_date, :string
  end
end
