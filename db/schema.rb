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

ActiveRecord::Schema.define(version: 20161018040827) do

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

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
    t.index ["type"], name: "index_mailboxer_notifications_on_type", using: :btree
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree
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
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
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
