class AddIndexToBenches < ActiveRecord::Migration[5.2]
  def change
    add_index :benches, :description
  end
end
