class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :customer_id, foreign_key: true
      t.integer :product_id, foreign_key: true
      t.integer :producer_id, foreign_key: true
      t.integer :recipe_id, foreign_key: true

      t.timestamps
    end
  end
end
