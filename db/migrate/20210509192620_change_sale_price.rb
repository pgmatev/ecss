class ChangeSalePrice < ActiveRecord::Migration[6.0]
  def change
    rename_column :sales, :price, :total_price
  end
end
