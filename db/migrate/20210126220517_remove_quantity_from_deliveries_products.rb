class RemoveQuantityFromDeliveriesProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :deliveries_products, :qantity
  end
end
