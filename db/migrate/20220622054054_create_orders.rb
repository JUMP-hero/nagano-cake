class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :post_code
      t.string :address
      t.string :address_name
      t.integer :postage ,defalt: 800
      t.integer :total_amount
      t.integer :payment_method, default: 0
      t.integer :order_status, default: 0


      t.timestamps
    end
  end
end
