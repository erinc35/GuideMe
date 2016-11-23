class AddOnlineToTraveler < ActiveRecord::Migration[5.0]
  def change
    add_column :travelers, :online, :string
  end
end
