# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :join_tag_gossips
  has_many :gossips, through: :join_tag_gossips

  validates :title, length: { minimum: 3, maximum: 14 }, presence: true
end
