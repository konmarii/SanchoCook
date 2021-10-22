class Entry < ApplicationRecord
  belongs_to :room
  belongs_to :customer
  belongs_to :producer
end
