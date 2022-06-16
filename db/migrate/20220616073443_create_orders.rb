class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :post_code
      t.string :address
      t.string :address_name
      t.integer :postage
      t.integer :total_amount
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
