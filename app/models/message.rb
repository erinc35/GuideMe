class Message < ApplicationRecord
  belongs_to :messenger, polymorphic: true
  validates :content, presence: true
  scope :for_display, -> {order(:created_at).last(50)}

  validates_presence_of :body, :conversation_id, :messenger_id
end
