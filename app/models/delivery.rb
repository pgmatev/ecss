class Delivery < ApplicationRecord
    belongs_to :user
    has_many :products, through: :products_deliveries
    has_many :products_deliveries

    def init
        self.cost ||= 0.0
    end
end
