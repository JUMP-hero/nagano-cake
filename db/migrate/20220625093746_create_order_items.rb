class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer "item_id"
      t.integer "order_id"
      t.integer "price"
      t.integer "quantity"
      t.integer "produciton_status", default: 0, null: false
      t.timestamps
    end
  end
end
