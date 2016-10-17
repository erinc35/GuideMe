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

ActiveRecord::Schema.define(version: 20161017200810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_dates", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "guide_id"
    t.index ["guide_id"], name: "index_available_dates_on_guide_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "topic"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "language"
    t.string   "phone"
    t.string   "location"
    t.string   "has_car"
    t.string   "photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "online"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "guide_id"
    t.integer  "traveler_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["guide_id"], name: "index_messages_on_guide_id", using: :btree
    t.index ["traveler_id"], name: "index_messages_on_traveler_id", using: :btree
  end

  create_table "registrations", force: :cascade do |t|
    t.text     "notification_params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "cost"
    t.integer  "guide_id"
    t.integer  "traveler_id"
    t.string   "language"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["guide_id"], name: "index_reservations_on_guide_id", using: :btree
    t.index ["traveler_id"], name: "index_reservations_on_traveler_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.integer  "guide_id"
    t.integer  "traveler_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["guide_id"], name: "index_reviews_on_guide_id", using: :btree
    t.index ["traveler_id"], name: "index_reviews_on_traveler_id", using: :btree
  end

  create_table "travelers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "language"
    t.string   "phone"
    t.string   "photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "online"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "traveler_id"
    t.string   "location"
    t.string   "interests"
    t.text     "requests"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["guide_id"], name: "index_trips_on_guide_id", using: :btree
    t.index ["traveler_id"], name: "index_trips_on_traveler_id", using: :btree
  end

  create_table "unavailable_dates", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "guide_id"
    t.index ["guide_id"], name: "index_unavailable_dates_on_guide_id", using: :btree
  end

  add_foreign_key "available_dates", "guides"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "guides"
  add_foreign_key "messages", "travelers"
  add_foreign_key "reservations", "guides"
  add_foreign_key "reservations", "travelers"
  add_foreign_key "reviews", "guides"
  add_foreign_key "reviews", "travelers"
  add_foreign_key "trips", "guides"
  add_foreign_key "trips", "travelers"
  add_foreign_key "unavailable_dates", "guides"
end
