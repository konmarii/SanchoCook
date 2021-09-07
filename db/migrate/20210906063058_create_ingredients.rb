class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id, null:false, foreign_key: true
      t.string :name, null:false
      t.integer :amount, null:false
      t.string :unit, null:false
      t.timestamps
    end
  end
end
