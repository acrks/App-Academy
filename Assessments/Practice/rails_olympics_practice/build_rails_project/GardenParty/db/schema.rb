# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_15_215741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flowers", force: :cascade do |t|
    t.string "flower_type", null: false
    t.integer "gardener_id", null: false
    t.integer "garden_id", null: false
    t.index ["flower_type"], name: "index_flowers_on_flower_type"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name", null: false
    t.integer "size", null: false
    t.integer "garden_owner_id", null: false
    t.index ["garden_owner_id", "name"], name: "index_gardens_on_garden_owner_id_and_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.index ["username"], name: "index_users_on_username"
  end

end
