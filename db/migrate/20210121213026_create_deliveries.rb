class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :company, limit: 128
      t.decimal :cost, precision: 10, scale: 2
      t.integer :quantity, array: true
      t.timestamps
    end
    change_table :products do |t|
      t.string :barcode, limit: 12, unique: true
    end
    add_reference :deliveries, :users, index:true
    add_reference :deliveries, :products, index:true, array: true
  end
end
