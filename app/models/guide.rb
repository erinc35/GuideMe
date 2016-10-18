class Guide < ApplicationRecord
  has_many :trips
  has_many :reviews
  has_many :available_dates
  has_many :conversations, as: :sender
  has_many :conversations, as: :recipient

  has_many :unavailable_dates
  has_one :user, through: :trip
  has_one :traveler, through: :trip

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :language, presence: true
  validates :phone, presence: true
  validates :location, presence: true
  validates :has_car, presence: true

  has_secure_password
end
