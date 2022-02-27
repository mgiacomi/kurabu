class CreatePayments < ActiveRecord::Migration[5.0]
  def change

    create_table "payments", force: :cascade do |t|
      t.integer  "signup_id",    limit: 4
      t.string   "accepted",     limit: 255
      t.string   "pmtnum",       limit: 255
      t.string   "pmtdate",      limit: 255
      t.string   "amount",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "receipt_date"
      t.string   "scholarship",  limit: 255
    end

  end
end
