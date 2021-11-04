# frozen_string_literal: true

class Dm < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_many :join_user_dms
  has_many :recipients, class_name: 'User', through: :join_user_dms

  validates :content, length: { maximum: 140 }, presence: true
end
