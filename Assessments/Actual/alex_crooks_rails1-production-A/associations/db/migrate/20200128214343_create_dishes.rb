class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :restaurant_id, null: false
      t.timestamps
    end
  end
end
