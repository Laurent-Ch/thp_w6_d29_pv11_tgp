# frozen_string_literal: true

class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
