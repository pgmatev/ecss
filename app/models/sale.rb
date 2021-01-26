class Sale < ApplicationRecord
    validates_numericality_of :price, greater_than_or_equal_to: 0
    belongs_to :user
    belongs_to :client
    has_and_belongs_to_many :products
end
