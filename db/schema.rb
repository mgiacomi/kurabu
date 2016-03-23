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

ActiveRecord::Schema.define(version: 20160323031845) do

  create_table "payments", force: :cascade do |t|
    t.integer  "signup_id",  limit: 4
    t.string   "accepted",   limit: 255
    t.string   "pmtnum",     limit: 255
    t.string   "pmtdate",    limit: 255
    t.string   "amount",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signups", force: :cascade do |t|
    t.string "cfname",                limit: 45
    t.string "clname",                limit: 45
    t.string "cgender",               limit: 45
    t.string "cmonth",                limit: 45
    t.string "cday",                  limit: 45
    t.string "cyear",                 limit: 45
    t.string "cage",                  limit: 45
    t.string "p1fname",               limit: 45
    t.string "p1lname",               limit: 45
    t.string "p2fname",               limit: 45
    t.string "p2lname",               limit: 45
    t.string "phone1",                limit: 45
    t.string "phone2",                limit: 45
    t.string "email",                 limit: 45
    t.string "street",                limit: 255
    t.string "city",                  limit: 45
    t.string "state",                 limit: 45
    t.string "zip",                   limit: 45
    t.string "session1",              limit: 45
    t.string "session2",              limit: 45
    t.string "session3",              limit: 45
    t.string "session4",              limit: 45
    t.string "session5",              limit: 45
    t.text   "special",               limit: 16777215
    t.text   "medical",               limit: 16777215
    t.string "medical_agree",         limit: 45
    t.string "medical_signed",        limit: 255
    t.string "medical_signed_date",   limit: 45
    t.string "econtact_name",         limit: 45
    t.string "econtact_relationship", limit: 45
    t.string "econtact_phone",        limit: 45
    t.string "econtact_address",      limit: 256
    t.string "activity_cname",        limit: 255
    t.string "activity_agree",        limit: 45
    t.string "activity_signed",       limit: 255
    t.string "activity_signed_date",  limit: 45
    t.string "photo_agree",           limit: 45
    t.string "photo_signed",          limit: 255
    t.string "photo_signed_date",     limit: 45
    t.text   "directions",            limit: 16777215
    t.string "shots_date",            limit: 45
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
