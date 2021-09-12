class Recipe < ApplicationRecord
  belongs_to :product
  has_many :ingredients
  has_many :recipe_details

  attachment :image
end
