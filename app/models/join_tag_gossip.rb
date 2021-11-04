# frozen_string_literal: true

class JoinTagGossip < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag
end
