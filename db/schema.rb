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

ActiveRecord::Schema.define(version: 2019_01_30_110942) do

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
