class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_customer_id, foreign_key: true
      t.integer :visited_producer_id, foreign_key: true
      t.integer :visitor_producer_id, foreign_key: true
      t.integer :visited_customer_id, foreign_key: true
      t.integer :room_id, null:false, foreign_key: true
      t.integer :message_id, null:false, foreign_key: true
      t.string :action
      t.boolean :checked
      t.boolean :visitor_is_customer
      
      t.timestamps
    end
  end
end
