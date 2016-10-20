class AddLatitudeAndLongitudeToGeocode < ActiveRecord::Migration[5.0]
  def change
    add_column :geocodes, :address, :string
    add_column :geocodes, :latitude, :float
    add_column :geocodes, :longitude, :float
  end
end
