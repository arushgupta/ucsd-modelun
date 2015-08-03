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

ActiveRecord::Schema.define(version: 20150724113810) do

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

  create_table "apply_nows", force: :cascade do |t|
    t.string   "headline"
    t.string   "button_url"
    t.string   "button_text"
    t.string   "image_url"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "committees", force: :cascade do |t|
    t.integer  "order"
    t.string   "committee_name"
    t.string   "chair"
    t.string   "vice_chair"
    t.string   "topic_guide_url"
    t.string   "image_url"
    t.integer  "category_id"
    t.boolean  "is_active",       default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "deadlines", force: :cascade do |t|
    t.string   "deadline_info"
    t.date     "date"
    t.integer  "phase_id"
    t.string   "fee"
    t.integer  "category_id"
    t.boolean  "is_active",     default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "activity"
    t.string   "place"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "schedule_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id", default: 1
    t.boolean  "is_active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "home_galleries", force: :cascade do |t|
    t.string   "image_url"
    t.string   "image_text"
    t.string   "button_url"
    t.string   "button_text"
    t.string   "image_title"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "overviews", force: :cascade do |t|
    t.string   "season"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "content"
    t.text     "meta_keywords"
    t.string   "meta_title"
    t.integer  "category_id"
    t.boolean  "is_active",     default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.integer  "faq_id"
    t.boolean  "is_active",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "secretariats", force: :cascade do |t|
    t.string   "position"
    t.string   "name"
    t.string   "college"
    t.string   "major"
    t.text     "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "panel"
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "order"
    t.string   "topic_name"
    t.string   "image_url"
    t.text     "description"
    t.integer  "committee_id"
    t.boolean  "is_active",    default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "travel_conferences", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "season"
    t.integer  "year"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.string   "host"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_active",       default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
