class Client < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :sales
    validates_numericality_of :currency, greater_than_or_equal_to: 0
end
