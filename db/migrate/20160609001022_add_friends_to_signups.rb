class AddFriendsToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :friends, :text, limit: 16777215
  end
end
