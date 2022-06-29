class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_deails
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, production: 2, preparing: 3, shipping: 4}
  
  def sum_of_order_price
    total_amount + postage
  end
end
