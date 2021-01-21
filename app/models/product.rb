class Product < ApplicationRecord
    self.primary_key = 'barcode'
    validates_numericality_of :price, greater_than_or_equal_to: 0
    validates_numericality_of :quantity, greater_than_or_equal_to: 0
    validates :barcode, :format => { :with => /\A\d{12}\z/ }
    belongs_to :user
    belongs_to :delivery
end
