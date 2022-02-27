class AddFriendsToSignups < ActiveRecord::Migration[5.0]
  def change
    add_column :signups, :friends, :text, limit: 16777215
  end
end
