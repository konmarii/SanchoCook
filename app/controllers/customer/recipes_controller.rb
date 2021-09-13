class Customer::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
    @recipe_details = RecipeDetail.where(recipe_id: @recipe.id)    
  end
end
