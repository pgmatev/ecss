# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerProductSalesInsert < ActiveRecord::Migration[6.0]
  def up
    create_trigger("product_sales_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("product_sales").
        after(:insert) do
      "UPDATE sales SET price = price + 1 WHERE id = NEW.sale_id;"
    end
  end

  def down
    drop_trigger("product_sales_after_insert_row_tr", "product_sales", :generated => true)
  end
end
