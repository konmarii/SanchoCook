class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :customer_id, null:false, foreign_key: true
      t.integer :producer_id, null:false, foreign_key: true
      t.integer :room_id, null:false

      t.timestamps
    end
  end
end
