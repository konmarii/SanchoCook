class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null:false, foreign_key: true
      t.integer :product_id, null:false, foreign_key: true
      t.integer :tax_price, null:false
      t.integer :amount, null:false
      t.integer :harvest_status, null:false, default: 0
      t.timestamps
    end
  end
end
