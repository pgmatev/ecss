class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
    create_table :deliveries_products, id: false do |t|
      t.belongs_to :delivery
      t.belongs_to :product
      t.integer :qantity
    end
    create_table :sales_products, id: false do |t|
      t.belongs_to :sale
      t.belongs_to :product
    end
    remove_column :deliveries, :quantity
    add_reference :sales, :users, index:true
    add_reference :sales, :clients, index:true
  end
end
