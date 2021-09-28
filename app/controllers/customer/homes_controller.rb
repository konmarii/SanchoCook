class Customer::HomesController < ApplicationController
  def top
    @products = Product.find(FavoriteProduct.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
    @recipes = Recipe.find(FavoriteRecipe.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end

  def about
  end
end
