class Sale < ApplicationRecord
    belongs_to :user
    has_many :product_sales
    has_many :products, through: :product_sales
    # validates_numericality_of :price, greater_than_or_equal_to: 0
end
