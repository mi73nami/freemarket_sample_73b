class RemoveExistenceFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :existence, :boolean
  end
end
