class AddDetailsToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :token, :integer, null: false, uniqueness: true
    add_reference :credit_cards, :user, null: false, foreign_key: true
  end
end