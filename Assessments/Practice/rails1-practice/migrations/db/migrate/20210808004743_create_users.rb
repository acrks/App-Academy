class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :email, :username
    remove_column :users, :bio

    remove_column :videos, :name
    add_column :videos, :title, :string, null: false
    add_index :videos, :uploader_id
    
    # 'email' column
    #   has been renamed to 'username' (FAILED - 1)
    # 'bio' column
    #   has been removed (FAILED - 2)
  end
end
