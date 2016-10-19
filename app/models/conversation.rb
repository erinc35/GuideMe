class Conversation < ApplicationRecord
has_many :messages, dependent: :destroy

belongs_to :sender, polymorphic: true
belongs_to :recipient, polymorphic: true

scope :involving, -> (user) do
  where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
end

scope :between, -> (sender_id, sender_type, recipient_type, recipient_id) do
  where("(conversations.sender_id = ? AND conversations.sender_type = ? AND conversations.recipient_type = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.sender_type = ?
  AND conversations.recipient_type = ? AND conversations.recipient_id =?)", sender_id, sender_type, recipient_type, recipient_id, recipient_id, recipient_type, sender_type, sender_id)
end

end
