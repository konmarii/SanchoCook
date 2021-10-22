class CreateFavoriteRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_recipes do |t|
      t.integer :customer_id, foreign_key: true
      t.integer :recipe_id, foreign_key: true

      t.timestamps
    end
  end
end
