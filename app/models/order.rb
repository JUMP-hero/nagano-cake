class Order < ApplicationRecord

  belongs_to :user

  enum order_status: {
    waiting: 0,
    paid_up: 1,
    production: 2,
    preparing: 3,
    shipped: 4
}
end
