class ChangeDatatypeShippingAreaOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :shipping_area, :integer
  end
end
