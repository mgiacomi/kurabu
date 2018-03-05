class AddTsizeToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :tsize, :string, limit: 5
  end
end
