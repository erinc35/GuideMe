class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :guide, index: true, foreign_key: true
      t.references :traveler, index: true, foreign_key: true
      t.references :conversation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
