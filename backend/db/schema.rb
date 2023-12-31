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

ActiveRecord::Schema[7.0].define(version: 2023_09_30_092553) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemon_types", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_pokemon_types_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemon_types_on_type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "pokemon_id"
    t.string "name", limit: 255, null: false
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "block", null: false
    t.integer "contact", null: false
    t.integer "diffence", null: false
    t.integer "speed", null: false
    t.string "avility1", limit: 255, null: false
    t.string "avility2", limit: 255
    t.string "hidden_avility", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pokemon_types", "pokemons"
  add_foreign_key "pokemon_types", "types"
end
