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

ActiveRecord::Schema.define(version: 20140524111048) do

  create_table "announcements", force: true do |t|
    t.time     "time"
    t.text     "message"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "unique_code"
    t.datetime "datetime"
  end

  create_table "assignments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "company_id"
  end

  add_index "assignments", ["company_id"], name: "index_assignments_on_company_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "ticker"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hk_ticker"
    t.string   "pretty_name"
    t.string   "bloomberg_subindustry"
    t.string   "bloomberg_security_type"
  end

  add_index "companies", ["hk_ticker"], name: "index_companies_on_hk_ticker"
  add_index "companies", ["ticker"], name: "index_companies_on_ticker"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
