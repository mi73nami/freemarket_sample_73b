class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string   :name,           null:false
      t.text     :detail,         null:false
      t.string   :condition,      null:false
      t.integer  :delivery_fee,   null:false
      t.string   :shipping_area,  null:false
      t.integer  :shipping_days,  null:false
      t.integer  :price,          null:false
      t.boolean  :existence,      null:false
      t.timestamps
    end
  end
end