class Product < ApplicationRecord
    validates_numericality_of :price, greater_than_or_equal_to: 0
    validates_numericality_of :quantity, greater_than_or_equal_to: 0
    validates :barcode, :format => { :with => /\A\d{12}\z/ }
    belongs_to :user
    has_many :deliveries, through: :deliveries_products
    has_many :products_sales
    has_many :sales, through: :product_sales
end
