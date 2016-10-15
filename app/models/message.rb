class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :messenger, polymorphic: true

  validates_presence_of :body, :conversation_id, :messenger_id
end
