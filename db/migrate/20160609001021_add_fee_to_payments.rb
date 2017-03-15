class AddFeeToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :fee, :string, limit: 48
  end
end
