class Like < ApplicationRecord
  belongs_to :gossip, optional: true
  belongs_to :user
  validates :user_id, uniqueness: { scope: :gossip_id }
end
