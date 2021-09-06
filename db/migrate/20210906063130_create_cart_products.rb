class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :product_id, null:false, foreign_key: true
      t.integer :custmer_id, null:false, foreign_key: true
      t.integer :amount, null:false
      t.timestamps
    end
  end
end
