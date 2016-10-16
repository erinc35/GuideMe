class Message < ApplicationRecord
  belongs_to :messenger, polymorphic: true
  validates :content, presence: true
  scope :for_display, -> {order(:created_at).last(50)}

  validates_presence_of :content, :messenger_id
end
