# frozen_string_literal: true

class City < ApplicationRecord
  has_many :users
  validates :name, presence: true
  validates :zip_code, length: { is: 5 }, presence: true
end
