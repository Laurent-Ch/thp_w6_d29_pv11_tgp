# frozen_string_literal: true

class Fixingossip < ActiveRecord::Migration[5.2]
  def change
    add_reference :gossips, :user, foreign_key: true
    remove_column :gossips, :tag_id
  end
end
