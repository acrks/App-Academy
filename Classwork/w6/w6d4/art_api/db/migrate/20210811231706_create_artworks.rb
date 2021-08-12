# frozen_string_literal: true

class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false, unique: true
      t.integer :artist_id, null: false, foreign_key: true
    end
    add_index :artworks, %i[artist_id title], unique: true
  end
end
