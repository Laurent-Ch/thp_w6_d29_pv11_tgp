# frozen_string_literal: true

class CreateDms < ActiveRecord::Migration[5.2]
  def change
    create_table :dms do |t|
      t.text :content
      t.references :sender, index: true
      t.timestamps
    end
  end
end
