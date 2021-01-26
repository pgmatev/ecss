class DatabaseNormalisation < ActiveRecord::Migration[6.0]
  def change
    add_column :users_clients, :currency, :decimal, precision: 10, scale: 2
    remove_column :clients, :currency
    remove_column :deliveries, :products_id
  end
end
