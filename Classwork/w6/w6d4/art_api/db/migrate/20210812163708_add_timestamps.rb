class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false
    add_column :artworks, :created_at, :datetime, null: false
    add_column :artworks, :updated_at, :datetime, null: false
    add_column :artwork_shares, :created_at, :datetime, null: false
    add_column :artwork_shares, :updated_at, :datetime, null: false
    

  end
end
