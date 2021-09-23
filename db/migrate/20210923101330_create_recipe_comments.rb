class CreateRecipeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_comments do |t|
      t.integer :customer_id, null: false, foreign_key: true
      t.integer :recipe_id, null: false, foreign_key: true
      t.text :comment, null: false

      t.timestamps
    end
  end
end
