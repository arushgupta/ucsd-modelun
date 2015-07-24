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

ActiveRecord::Schema.define(version: 20150722063855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "deadlines", force: :cascade do |t|
    t.string   "text"
    t.integer  "category_id"
    t.datetime "date"
    t.integer  "phase_id"
    t.string   "fee"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "activity"
    t.string   "place"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "is_active"
    t.integer  "schedule_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "overviews", force: :cascade do |t|
    t.string   "session"
    t.integer  "year"
    t.date     "date"
    t.string   "location"
    t.integer  "number"
    t.boolean  "is_active"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "content"
    t.text     "meta_keywords"
    t.string   "meta_title"
    t.boolean  "is_active"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.boolean  "is_active"
    t.integer  "faq_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.boolean  "is_active"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "secretariats", force: :cascade do |t|
    t.string   "position"
    t.string   "name"
    t.string   "college"
    t.string   "major"
    t.string   "description"
    t.string   "image"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "panel"
    t.string   "name"
    t.string   "description"
    t.boolean  "is_active"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
