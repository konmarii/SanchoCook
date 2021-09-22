class Recipe < ApplicationRecord
  belongs_to :product
  has_many :ingredients
  has_many :recipe_details
  has_many :favorite_recipes

  attachment :image
  
  def favorited_by?(current_customer)
    favorite_recipes.where(customer_id: current_customer.id).exists?
  end  

  def self.looks(search, word)
    if search == "perfect_match"
      @recipe = Recipe.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @recipe = Recipe.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @recipe = Recipe.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @recipe = Recipe.where("name LIKE?","%#{word}%")
    else
      @recipe = Recipe.all
    end
  end
end
