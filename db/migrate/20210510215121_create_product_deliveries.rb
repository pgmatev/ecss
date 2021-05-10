class CreateProductDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :product_deliveries do |t|
      t.integer :product_id
      t.integer :delivery_id
      t.timestamps
    end
    drop_table :deliveries_products
  end
end