class Traveler < ApplicationRecord
  acts_as_messageable

  has_many :trips
  has_many :reviews
  has_one :guide, through: :trip
  has_many :conversations, as: :sender
  has_many :conversations, as: :recipient
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  # validates :language, presence: true
  # validates :phone, presence: true

  has_secure_password
  def name
    return :first_name
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return :email
    #if false
    #return nil
  end
end
