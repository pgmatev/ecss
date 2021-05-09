# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerProductSalesInsert11 < ActiveRecord::Migration[6.0]
  def up
    drop_trigger("product_sales_after_insert_row_tr", "product_sales", :generated => true)

    create_trigger("product_sales_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("product_sales").
        after(:insert) do
      <<-SQL_ACTIONS
UPDATE sales
        SET total_price = total_price + products.price
        FROM products
        WHERE sales.id = NEW.sale_id AND products.id = NEW.product_id;
        UPDATE products
        SET quantity = quantity - 1
        WHERE products.id = NEW.product_id;
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("product_sales_after_insert_row_tr", "product_sales", :generated => true)

    create_trigger("product_sales_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("product_sales").
        after(:insert) do
      <<-SQL_ACTIONS
UPDATE products
        SET quantity = quantity - 1
        WHERE products.id = NEW.product_id;
      SQL_ACTIONS
    end
  end
end
