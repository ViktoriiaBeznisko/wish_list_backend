class AddUserIdToWishLists < ActiveRecord::Migration[6.0]
  def change
    add_column :wish_lists, :user_id, :integer
  end
end
