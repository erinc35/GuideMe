class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :language
      t.string :phone
      t.string :location
      t.string :has_car
      t.string :photo

      t.timestamps
    end
  end
end
