class AddOnlineToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :online, :string
  end
end
