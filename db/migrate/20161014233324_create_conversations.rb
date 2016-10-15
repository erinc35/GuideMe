class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :topic
      t.string :slug

      t.timestamps
    end
  end
end
