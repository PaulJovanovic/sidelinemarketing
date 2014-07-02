# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140702013042) do

  create_table "addresses", force: true do |t|
    t.string "order_id"
    t.string "first_name"
    t.string "last_name"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
  end

  create_table "assets", force: true do |t|
    t.string   "type"
    t.string   "assetable_type"
    t.integer  "assetable_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "placement"
    t.string   "name"
  end

  create_table "athletes", force: true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editables", force: true do |t|
    t.integer "page_id"
    t.string  "name"
    t.text    "text"
  end

  create_table "event_purchase_options", force: true do |t|
    t.integer "event_purchase_id"
    t.integer "quantity"
    t.integer "price_cents",       default: 0,     null: false
    t.string  "price_currency",    default: "USD", null: false
  end

  create_table "event_purchase_options_orders", force: true do |t|
    t.integer "event_purchase_option_id"
    t.integer "order_id"
  end

  create_table "event_purchases", force: true do |t|
    t.integer "event_id"
    t.string  "name"
    t.string  "description"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location_name"
    t.string   "location_street"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zip"
    t.datetime "date"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "active_at"
    t.datetime "expires_at"
    t.boolean  "private",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "email"
    t.string   "phone_number"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "placement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string "name"
  end

  create_table "slideshows", force: true do |t|
    t.string "name"
  end

  create_table "teams", force: true do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.integer  "placement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
