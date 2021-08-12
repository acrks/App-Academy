# frozen_string_literal: true

class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false, foreign_key: true
      t.integer :viewer_id, null: false, foreign_key: true
    end
    add_index :artwork_shares, %i[artwork_id viewer_id], unique: true
  end
end
