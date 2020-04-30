class RemoveSellerIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :seller_id, :integer
  end
end
