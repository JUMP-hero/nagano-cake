class Address < ApplicationRecord

  validates :customer_name, presence: true
  validates :customer_postcode, presence: true
  validates :customer_address, presence: true

end
