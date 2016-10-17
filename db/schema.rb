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
    t.string   "sender_type"
    t.integer  "sender_id"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["recipient_type", "recipient_id"], name: "index_conversations_on_recipient_type_and_recipient_id", using: :btree
    t.index ["sender_type", "sender_id"], name: "index_conversations_on_sender_type_and_sender_id", using: :btree
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
    t.string   "content"
    t.integer  "conversation_id"
    t.string   "messenger_type"
    t.integer  "messenger_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["messenger_type", "messenger_id"], name: "index_messages_on_messenger_type_and_messenger_id", using: :btree
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
  add_foreign_key "reviews", "guides"
  add_foreign_key "reviews", "travelers"
  add_foreign_key "trips", "guides"
  add_foreign_key "trips", "travelers"
  add_foreign_key "unavailable_dates", "guides"
end
