class AddFeeToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :fee, :string, limit: 48
  end
end
