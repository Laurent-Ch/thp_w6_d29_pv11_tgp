# frozen_string_literal: true

class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips
  has_many :comments
  has_many :likes

  validates :title, length: { minimum: 3, maximum: 14 }, presence: true
  validates :content, presence: true
end
