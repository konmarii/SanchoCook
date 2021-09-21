class Customer::FavoritesController < ApplicationController

  def index
  end

  def create_product_favorite
    @product = Product.find(params[:product_id])
    favorite = current_customer.favorites.new(product_id: @product.id)
    favorite.save
  end
  
  def destroy_product_favorite
    @product = Product.find(params[:product_id])
    favorite = current_customer.favorites.find_by(product_id: @product.id)
    favorite.destroy
  end
  
  def create_recipe_favorite
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_customer.favorites.new(recipe_id: @recipe.id)
    favorite.save
  end
  
  def destroy_recipe_favorite
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_customer.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
  end
  
end
