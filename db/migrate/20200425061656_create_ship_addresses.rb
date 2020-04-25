class CreateShipAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_addresses do |t|
      t.string  :last_name,       null:false
      t.string  :first_name,      null:false
      t.string  :ruby_last_name,  null:false
      t.string  :ruby_first_name, null:false
      t.integer :postal_code,     null:false
      t.string  :prefectures,     null:false
      t.string  :city,            null:false
      t.string  :address_detail,  null:false
      t.string  :apartment_name 
      t.string  :room_number    
      t.string  :phone_number      
      t.references :user, null: false, foreign_key: true
      t.timestamps

    end
  end
end
