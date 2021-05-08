class Product < ApplicationRecord
    validates_numericality_of :price, greater_than_or_equal_to: 0
    validates_numericality_of :quantity, greater_than_or_equal_to: 0
    validates :barcode, :format => { :with => /\A\d{12}\z/ }
    belongs_to :user
    has_and_belongs_to_many :deliveries
    has_and_belongs_to_many :sales
end
