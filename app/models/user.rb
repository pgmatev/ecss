class User < ApplicationRecord
  include Clearance::User
  has_many: products
  has_many: deliveries
  has_many: sales
  has_and_belongs_to_many: clients
end
