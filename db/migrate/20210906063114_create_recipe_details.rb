class CreateRecipeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_details do |t|
      t.integer :recipe_id, null:false, foreign_key: true
      t.string :image_id, null:false
      t.text :explanation, null:false
      t.timestamps
    end
  end
end
