class Traveler < ApplicationRecord
  has_many :trips
  has_many :reviews
  has_one :user, through: :trip

  has_secure_password
end
