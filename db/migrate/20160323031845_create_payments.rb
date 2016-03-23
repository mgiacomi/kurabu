class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer "signup_id"
      t.string "accepted"
      t.string "pmtnum"
      t.string "pmtdate"
      t.string "amount"

      t.timestamps
    end
  end
end
