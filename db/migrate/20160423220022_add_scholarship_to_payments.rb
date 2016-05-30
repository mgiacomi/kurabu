class AddScholarshipToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :scholarship, :string
  end
end
