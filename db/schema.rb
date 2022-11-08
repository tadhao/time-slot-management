# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_08_054735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slot_collections", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "slot_id", null: false
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slot_id"], name: "index_slot_collections_on_slot_id"
  end

  create_table "slots", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "total_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "slot_collections", "slots"
end
