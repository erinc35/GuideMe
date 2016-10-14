class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :traveler
  belongs_to :guide

  validates :topic, presence: true , uniqueness: true, case_sensitive: false 
end
