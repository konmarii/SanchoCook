class Recipe < ApplicationRecord
  belongs_to :recipe
  has_many :ingredients
  has_many :recipe_details
end
