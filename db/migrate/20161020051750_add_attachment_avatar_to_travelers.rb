class AddAttachmentAvatarToTravelers < ActiveRecord::Migration
  def self.up
    change_table :travelers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :travelers, :avatar
  end
end
