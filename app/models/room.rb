class Room < ApplicationRecord
  has_many :entries
  has_many :messages
  has_many :notifications, dependent: :destroy
  
  def self.find_or_create_entry!(producer)
    entry = current_customer.entries.find_or_initialize(producer_id: producer.id)
    
    Room.transaction do
      if entry.new_record?
        room.Room.create!
        entry.room_id = room.id
        entry.save!
      end
    end
    entry
  end
end
