class Review < ApplicationRecord
  belongs_to :guide
  belongs_to :traveler
end
