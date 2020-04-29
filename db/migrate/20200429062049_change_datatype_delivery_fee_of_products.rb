class ChangeDatatypeDeliveryFeeOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :delivery_fee, :string
    change_column :products, :shipping_days, :string
  end
end
