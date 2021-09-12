class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :producer_id, null:false, foreign_key: true
      t.string :name, null:false
      t.text :introduction, null:false
      t.string :image_id, null:false
      t.integer :tax_excluded_price, null:false
      t.boolean :sales_status, null:false, default: true
      t.timestamps
    end
  end
end
