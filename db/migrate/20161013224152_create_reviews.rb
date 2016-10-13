class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :guide, foreign_key: true
      t.references :traveler, foreign_key: true

      t.timestamps
    end
  end
end
