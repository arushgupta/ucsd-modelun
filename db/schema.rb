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

ActiveRecord::Schema.define(version: 20150903114854) do

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

  create_table "alumnis", force: :cascade do |t|
    t.string   "name"
    t.string   "major"
    t.string   "email"
    t.string   "image_url"
    t.text     "bio"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "apply_nows", force: :cascade do |t|
    t.string   "headline"
    t.string   "button_url"
    t.string   "button_text"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "awards", force: :cascade do |t|
    t.string   "award_name"
    t.string   "award_recipient"
    t.integer  "award_count",          default: 1
    t.integer  "travel_conference_id"
    t.integer  "category_id"
    t.boolean  "is_active",            default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "subheading"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "committees", force: :cascade do |t|
    t.integer  "order_id"
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

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "home_galleries", force: :cascade do |t|
    t.string   "image_url"
    t.string   "image_text"
    t.string   "button_url"
    t.string   "button_text"
    t.string   "image_title"
    t.string   "gallery_type"
    t.boolean  "is_home_img"
    t.integer  "category_id"
    t.boolean  "is_active",    default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "icons", force: :cascade do |t|
    t.string   "overview_icon"
    t.string   "sechedule_icon"
    t.string   "commitee_icon"
    t.string   "speaker_icon"
    t.string   "fee_icon"
    t.string   "faq_icon"
    t.string   "training_session_icon"
    t.string   "travel_conferences_icon"
    t.string   "awards_icon"
    t.string   "alumni_icon"
    t.string   "galleries_icon"
    t.string   "secretariats_icon"
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "overviews", force: :cascade do |t|
    t.string   "season"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.string   "registration_form_url"
    t.integer  "delegation_fee"
    t.date     "position_paper_deadline"
    t.text     "welcome_letter"
    t.integer  "category_id"
    t.boolean  "is_active",               default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "content"
    t.text     "meta_keywords"
    t.string   "meta_title"
    t.string   "subheading"
    t.text     "page_description"
    t.string   "page_icon_url"
    t.boolean  "info_page"
    t.integer  "category_id"
    t.boolean  "is_active",        default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
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
    t.string   "email"
    t.string   "fb_url"
    t.string   "tw_url"
    t.string   "in_url"
    t.string   "website_url"
    t.text     "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "panel"
    t.string   "name"
    t.string   "fb_url"
    t.string   "tw_url"
    t.string   "in_url"
    t.string   "website_url"
    t.text     "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "logo_url"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "topic_name"
    t.string   "image_url"
    t.text     "description"
    t.integer  "committee_id"
    t.boolean  "is_active",    default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "training_sessions", force: :cascade do |t|
    t.date     "date"
    t.string   "committee_name"
    t.string   "topic_name"
    t.string   "topic_description"
    t.string   "location"
    t.string   "topic_image_url"
    t.string   "committee_image_url"
    t.string   "topic_guide_url"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "category_id"
    t.boolean  "is_active",           default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
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
    t.string   "application_url"
    t.string   "travel_team_image_url"
    t.integer  "category_id"
    t.boolean  "is_active",             default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "is_active",       default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
