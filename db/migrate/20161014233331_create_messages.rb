class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :messenger, polymorphic: true, index:true
      t.references :conversation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
