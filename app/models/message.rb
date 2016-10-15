class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :traveler
  belongs_to :guide

  validates_presence_of :body, :conversation_id, :guide_id, :traveler_id
end
