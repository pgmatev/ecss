class ProductSale < ApplicationRecord
    belongs_to :product
    belongs_to :sale
    trigger.after(:insert) do
        "UPDATE sales
        SET total_price = total_price + products.price
        FROM products
        WHERE sales.id = NEW.sale_id AND products.id = NEW.product_id"
    end
end
