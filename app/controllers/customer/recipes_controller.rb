class Customer::RecipesController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    @recipes = Recipe.all
    @recipes_pagination = @recipes.page(params[:page]).per(9)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @favorite_recipe = FavoriteRecipe.where(customer_id: current_customer.id, recipe_id: @recipe.id)
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
    @recipe_details = RecipeDetail.where(recipe_id: @recipe.id)
    @new_recipe_comment = RecipeComment.new
    @recipe_comments = RecipeComment.where(recipe_id: @recipe.id)
  end
end
