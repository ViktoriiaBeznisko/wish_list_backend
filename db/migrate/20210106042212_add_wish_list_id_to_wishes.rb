class AddWishListIdToWishes < ActiveRecord::Migration[6.0]
  def change
    add_column :wishes, :wish_list_id, :integer
  end
end
