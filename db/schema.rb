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

ActiveRecord::Schema.define(version: 2018_08_28_065206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "references_districts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_responses", force: :cascade do |t|
    t.string "name", null: false, comment: "API name"
    t.string "endpoint", null: false, comment: "API endpoint"
    t.string "action", null: false, comment: "Endpoint action"
    t.string "params", null: false, comment: "Request params"
    t.string "sha1", null: false, comment: "Hash of the response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
