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

ActiveRecord::Schema.define(version: 20170722144538) do

  create_table "one_time_links", force: :cascade do |t|
    t.string "path", null: false
    t.string "token", null: false
    t.datetime "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["path", "token"], name: "index_one_time_links_on_path_and_token"
    t.index ["token"], name: "index_one_time_links_on_token", unique: true
  end

  create_table "transfer_schedules", force: :cascade do |t|
    t.string "recipient"
    t.integer "amount"
    t.string "message"
    t.text "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.string "recipient", null: false
    t.integer "amount", null: false
    t.string "message"
    t.datetime "executed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
