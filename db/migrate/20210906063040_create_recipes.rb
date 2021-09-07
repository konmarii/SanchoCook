class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :products_id, null:false, foreign_key: true
      t.string :name, null:false
      t.string :image_id, null:false
      t.text :introduction, null:false
      t.timestamps
    end
  end
end
