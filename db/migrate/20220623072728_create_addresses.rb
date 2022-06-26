class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.integer :customer_id
      t.string :customer_name
      t.string :address
      t.string :post_code


      t.timestamps
    end
  end
end
