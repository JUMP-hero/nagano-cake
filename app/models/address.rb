class Address < ApplicationRecord

  validates :customer_name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true


end
