class Conversation < ApplicationRecord
has_many :messages, dependent: :destroy

belongs_to :sender, polymorphic: true
belongs_to :recipient, polymorphic: true

validates_uniqueness_of :sender_id, :scope => :recipient_id

scope :involving, -> (user) do
  where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
end

scope :between, -> (sender_id,recipient_id) do
  where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
end

end
