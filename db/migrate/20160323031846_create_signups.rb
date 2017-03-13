class CreateSignups < ActiveRecord::Migration
  def change

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

  end
end
