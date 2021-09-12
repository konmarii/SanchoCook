class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :product_id, null:false, foreign_key: true
      t.string :name, null:false
      t.string :image_id
      t.text :introduction
      t.timestamps
    end
  end
end
