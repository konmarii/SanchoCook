class CreateFavoriteProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_products do |t|
      t.integer :customer_id, foreign_key: true
      t.integer :product_id, foreign_key: true

      t.timestamps
    end
  end
end
