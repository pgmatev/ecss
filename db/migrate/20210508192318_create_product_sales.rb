class CreateProductSales < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sales do |t|
      t.integer :product_id
      t.integer :sale_id
      t.timestamps
    end
    drop_table :products_sales
  end
end
