class AddTsizeToSignups < ActiveRecord::Migration[5.0]
  def change
    add_column :signups, :tsize, :string, limit: 5
  end
end
