class AddFullStreetAddressToGeocode < ActiveRecord::Migration[5.0]
  def change
    add_column :geocodes, :full_street_address, :string
  end
end
