class AddQuantityToDeliveriesProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries_products, :quantity, :integer
  end
end
