class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :traveler
  belongs_to :guide
end
