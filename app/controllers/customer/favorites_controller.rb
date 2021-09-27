class Customer::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @favorite_products = FavoriteProduct.where(customer_id: current_customer.id)
    @products = []
    @favorite_products.each do |favorite_product|
      @products << favorite_product.product
    end
    @products.flatten!
    @favorite_recipes = FavoriteRecipe.where(customer_id: current_customer.id)
    @recipes = []
    @favorite_recipes.each do |favorite_recipe|
      @recipes << favorite_recipe.recipe
    end
    @recipes.flatten!
  end
end
