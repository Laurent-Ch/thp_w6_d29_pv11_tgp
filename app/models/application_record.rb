# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def liked?(user)
    !!likes.find { |like| like.user_id == user.id }
  end
end
