# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Dm'
  has_many :join_user_dms
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Dm', through: :join_user_dms
  has_many :join_tag_gossips
  has_many :gossips, through: :join_tag_gossips
  has_many :comments
  has_many :likes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, length: { maximum: 140 }, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, presence: true

  def name_with_initial
    "#{first_name} #{last_name}"
  end

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
  
end
