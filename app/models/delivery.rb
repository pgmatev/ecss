class Delivery < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :products
    validates_numericality_of :cost, greater_than_or_equal_to: 0
end