class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 128
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
    add_column :users, :premium, :boolean, default: 0
  end
end