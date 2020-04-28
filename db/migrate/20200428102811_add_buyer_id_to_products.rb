class AddBuyerIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :buyer, foreign_key: {to_table: :users}
    add_reference :products, :seller, foreign_key: {to_table: :users}, null: false
  end
end
