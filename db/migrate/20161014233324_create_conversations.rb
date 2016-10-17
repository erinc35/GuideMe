class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :sender, polymorphic: true, index: true
      t.references :recipient, polymorphic: true, index: true

      t.timestamps
    end
  end
end
