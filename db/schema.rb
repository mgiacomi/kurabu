# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_03_034940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.integer "signup_id"
    t.string "accepted", limit: 255
    t.string "pmtnum", limit: 255
    t.string "pmtdate", limit: 255
    t.string "amount", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "receipt_date"
    t.string "scholarship", limit: 255
    t.string "fee", limit: 48
  end

  create_table "signups", id: :serial, force: :cascade do |t|
    t.string "cfname", limit: 45
    t.string "clname", limit: 45
    t.string "cgender", limit: 45
    t.string "cmonth", limit: 45
    t.string "cday", limit: 45
    t.string "cyear", limit: 45
    t.string "cage", limit: 45
    t.string "p1fname", limit: 45
    t.string "p1lname", limit: 45
    t.string "p2fname", limit: 45
    t.string "p2lname", limit: 45
    t.string "phone1", limit: 45
    t.string "phone2", limit: 45
    t.string "email", limit: 45
    t.string "street", limit: 255
    t.string "city", limit: 45
    t.string "state", limit: 45
    t.string "zip", limit: 45
    t.string "session1", limit: 45
    t.string "session2", limit: 45
    t.string "session3", limit: 45
    t.string "session4", limit: 45
    t.string "session5", limit: 45
    t.text "special"
    t.text "medical"
    t.string "medical_agree", limit: 45
    t.string "medical_signed", limit: 255
    t.string "medical_signed_date", limit: 45
    t.string "econtact_name", limit: 45
    t.string "econtact_relationship", limit: 45
    t.string "econtact_phone", limit: 45
    t.string "econtact_address", limit: 256
    t.string "pickup_name", limit: 45
    t.string "pickup_relationship", limit: 45
    t.string "pickup_phone", limit: 45
    t.string "activity_cname", limit: 255
    t.string "activity_agree", limit: 45
    t.string "activity_signed", limit: 255
    t.string "activity_signed_date", limit: 45
    t.string "photo_agree", limit: 45
    t.string "photo_signed", limit: 255
    t.string "photo_signed_date", limit: 45
    t.string "art_agree", limit: 45
    t.string "art_signed", limit: 255
    t.string "art_signed_date", limit: 45
    t.text "directions"
    t.string "shots_date", limit: 45
    t.text "friends"
    t.string "tsize", limit: 5
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
