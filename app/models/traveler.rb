class Traveler < ApplicationRecord
  has_many :trips
  has_many :reviews
  has_many :conversations
  has_many :messages
  has_one :user, through: :trip

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :language, presence: true
  validates :phone, presence: true

  has_secure_password
end
