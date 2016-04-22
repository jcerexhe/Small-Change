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

ActiveRecord::Schema.define(version: 20160420090551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beta_users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "amount_raised"
  end

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.string   "bsb"
    t.string   "account_number"
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "url"
    t.string   "logo"
    t.text     "blurb"
  end

  create_table "charity_categories", force: :cascade do |t|
    t.integer  "charity_id"
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
  end

  add_index "charity_categories", ["charity_id"], name: "index_charity_categories_on_charity_id", using: :btree

  create_table "charity_causes", force: :cascade do |t|
    t.integer  "cause_id"
    t.integer  "charity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "charity_causes", ["cause_id"], name: "index_charity_causes_on_cause_id", using: :btree
  add_index "charity_causes", ["charity_id"], name: "index_charity_causes_on_charity_id", using: :btree

  create_table "demo_day_contacts", force: :cascade do |t|
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "charity_id"
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "email"
  end

  add_index "donations", ["charity_id"], name: "index_donations_on_charity_id", using: :btree
  add_index "donations", ["submission_id"], name: "index_donations_on_submission_id", using: :btree
  add_index "donations", ["user_id"], name: "index_donations_on_user_id", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.string   "enquiry_type"
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "enquiries", ["user_id"], name: "index_enquiries_on_user_id", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "title"
    t.string   "favicon"
    t.text     "description"
    t.string   "image"
    t.integer  "charity"
    t.string   "petition_link"
    t.string   "submission_type"
    t.integer  "link_clicks",         default: 0
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "charity_category_id"
    t.boolean  "youtube"
  end

  add_index "submissions", ["charity_category_id"], name: "index_submissions_on_charity_category_id", using: :btree
  add_index "submissions", ["slug"], name: "index_submissions_on_slug", unique: true, using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "user_submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "donation_id"
    t.integer  "charity_id"
    t.integer  "cause_id"
  end

  add_index "user_submissions", ["cause_id"], name: "index_user_submissions_on_cause_id", using: :btree
  add_index "user_submissions", ["charity_id"], name: "index_user_submissions_on_charity_id", using: :btree
  add_index "user_submissions", ["donation_id"], name: "index_user_submissions_on_donation_id", using: :btree
  add_index "user_submissions", ["submission_id"], name: "index_user_submissions_on_submission_id", using: :btree
  add_index "user_submissions", ["user_id"], name: "index_user_submissions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.integer  "actions_taken",          default: 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.boolean  "terms_of_service"
    t.integer  "charity_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "charity_categories", "charities"
  add_foreign_key "charity_causes", "causes"
  add_foreign_key "charity_causes", "charities"
  add_foreign_key "donations", "charities"
  add_foreign_key "donations", "submissions"
  add_foreign_key "donations", "users"
  add_foreign_key "enquiries", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "submissions", "users"
  add_foreign_key "user_submissions", "causes"
  add_foreign_key "user_submissions", "charities"
  add_foreign_key "user_submissions", "donations"
  add_foreign_key "user_submissions", "submissions"
  add_foreign_key "user_submissions", "users"
end
