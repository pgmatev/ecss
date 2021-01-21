class ForeignKeyProductsTable < ActiveRecord::Migration[6.0]
  def change
      add_reference :products, :users, index:true
  end
end
