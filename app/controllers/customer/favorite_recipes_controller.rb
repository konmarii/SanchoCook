class Customer::FavoriteRecipesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite_recipe = current_customer.favorite_recipes.new(recipe_id: @recipe.id)
    @favorite_recipe.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite_recipe = current_customer.favorite_recipes.find_by(recipe_id: @recipe.id)
    favorite_recipe.destroy
  end
end
