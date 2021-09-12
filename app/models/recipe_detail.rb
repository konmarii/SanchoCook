class RecipeDetail < ApplicationRecord
  belongs_to :recipe

  attachment :image
end
