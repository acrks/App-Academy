class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :author_id, null: false
    end
    add_index :blogs, %i[author_id title], unique: true
  end
end
