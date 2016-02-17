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

ActiveRecord::Schema.define(version: 20160217014007) do

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
    t.string   "choose_charity_logo"
    t.string   "bsb"
    t.string   "account_number"
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "activity_one"
    t.string   "activity_two"
    t.string   "activity_three"
    t.integer  "cause_id"
    t.string   "url"
    t.string   "banner_logo"
  end

  add_index "charities", ["cause_id"], name: "index_charities_on_cause_id"

  create_table "charity_causes", force: :cascade do |t|
    t.integer  "cause_id"
    t.integer  "charity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "charity_causes", ["cause_id"], name: "index_charity_causes_on_cause_id"
  add_index "charity_causes", ["charity_id"], name: "index_charity_causes_on_charity_id"

  create_table "donations", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "charity_id"
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "donations", ["charity_id"], name: "index_donations_on_charity_id"
  add_index "donations", ["submission_id"], name: "index_donations_on_submission_id"
  add_index "donations", ["user_id"], name: "index_donations_on_user_id"

  create_table "enquiries", force: :cascade do |t|
    t.string   "enquiry_type"
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "enquiries", ["user_id"], name: "index_enquiries_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "submissions", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.string   "favicon"
    t.text     "description"
    t.string   "image"
    t.integer  "charity"
    t.boolean  "youtube"
    t.string   "type"
    t.string   "charity_link"
    t.string   "petition_link"
  end

  create_table "user_submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "donation_id"
    t.integer  "charity_id"
    t.integer  "cause_id"
  end

  add_index "user_submissions", ["cause_id"], name: "index_user_submissions_on_cause_id"
  add_index "user_submissions", ["charity_id"], name: "index_user_submissions_on_charity_id"
  add_index "user_submissions", ["donation_id"], name: "index_user_submissions_on_donation_id"
  add_index "user_submissions", ["submission_id"], name: "index_user_submissions_on_submission_id"
  add_index "user_submissions", ["user_id"], name: "index_user_submissions_on_user_id"

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
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
