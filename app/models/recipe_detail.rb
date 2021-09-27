class RecipeDetail < ApplicationRecord
  belongs_to :recipe
  
  validates :image, presence: true
  validates :explanation, presence: true

  attachment :image
end
