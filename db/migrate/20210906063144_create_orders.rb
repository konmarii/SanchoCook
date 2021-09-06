class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :custmer_id, null:false, foreign_key: true
      t.string :delivery_postal_code, null:false
      t.string :delivery_address, null:false
      t.string :delivery_name, null:false
      t.integer :delivery_fee, null:false
      t.integer :total_payment, null:false
      t.integer :order_status, null:false, default: 0
      t.integer :payment_method, null:false
      t.timestamps
    end
  end
end
