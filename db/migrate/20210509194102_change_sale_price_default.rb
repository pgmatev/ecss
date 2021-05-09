class ChangeSalePriceDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :sales, :total_price, :decimal, :default => 0.00
  end
end
