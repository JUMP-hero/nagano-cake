class Address < ApplicationRecord

  validates :address_name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true


end
