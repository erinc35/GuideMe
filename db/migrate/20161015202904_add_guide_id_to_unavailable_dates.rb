class AddGuideIdToUnavailableDates < ActiveRecord::Migration[5.0]
  def change
    add_reference :unavailable_dates, :guide, foreign_key: true
  end
end
