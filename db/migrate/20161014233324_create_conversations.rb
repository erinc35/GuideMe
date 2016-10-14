class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :guide, index: true, foreign_key: true
      t.references :traveler, index: true, foreign_key: true

      t.timestamps
    end
  end
end
