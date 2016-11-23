class AddAttachmentAvatarToGuides < ActiveRecord::Migration
  def self.up
    change_table :guides do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :guides, :avatar
  end
end
