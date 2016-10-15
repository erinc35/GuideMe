class AddGuideIdToAvailableDates < ActiveRecord::Migration[5.0]
  def change
    add_reference :available_dates, :guide, foreign_key: true
  end
end
