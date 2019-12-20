# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_30_203317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academicians", force: :cascade do |t|
    t.string "tc_kimlik_no"
    t.string "adi"
    t.string "soyadi"
    t.string "kadro_unvan"
    t.integer "birim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.integer "kod"
    t.string "ad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_responses", force: :cascade do |t|
    t.string "name", comment: "API name"
    t.string "endpoint", comment: "API endpoint"
    t.string "action", comment: "Endpoint action"
    t.string "params", comment: "Request params"
    t.string "sha1", comment: "Hash of the response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
