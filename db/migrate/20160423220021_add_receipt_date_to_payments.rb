class AddReceiptDateToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :receipt_date, :datetime
  end
end
