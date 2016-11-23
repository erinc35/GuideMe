class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :conversation, index: true 
      t.references :messenger, polymorphic: true, index:true

      t.timestamps
    end
  end
end
