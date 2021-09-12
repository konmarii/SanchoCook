class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum production_status: {
    unharvested: 0,
    harvesting: 1,
    harvested: 2
  }
end
