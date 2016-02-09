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

ActiveRecord::Schema.define(version: 20160208103437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_files", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "lesson_id"
    t.string   "telephone_code"
  end

  add_index "audio_files", ["lesson_id"], name: "index_audio_files_on_lesson_id", using: :btree

  create_table "calls", force: :cascade do |t|
    t.date     "call_date"
    t.time     "call_time"
    t.string   "duration"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "pin_code"
    t.string   "lesson_code"
    t.string   "subject_code"
  end

  add_index "calls", ["pin_code", "lesson_code", "subject_code"], name: "index_pin_sub_lessons", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "subject_id"
    t.integer  "audio_file_id"
    t.string   "les_id"
  end

  add_index "lessons", ["audio_file_id"], name: "index_lessons_on_audio_file_id", using: :btree
  add_index "lessons", ["subject_id"], name: "index_lessons_on_subject_id", using: :btree

  create_table "pins", force: :cascade do |t|
    t.string   "pincode"
    t.string   "serialcode"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.boolean  "activated",  default: false
  end

  add_index "pins", ["user_id"], name: "index_pins_on_user_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pin_id"
    t.integer  "user_id"
    t.integer  "subject_id"
  end

  add_index "registrations", ["pin_id", "subject_id"], name: "index_pin_subjects", unique: true, using: :btree
  add_index "registrations", ["pin_id", "user_id"], name: "index_pin_users", unique: true, using: :btree
  add_index "registrations", ["pin_id"], name: "index_registrations_on_pin_id", using: :btree
  add_index "registrations", ["subject_id"], name: "index_registrations_on_subject_id", using: :btree
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sub_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "pin_id"
  end

  add_index "users", ["pin_id"], name: "index_users_on_pin_id", using: :btree

end
