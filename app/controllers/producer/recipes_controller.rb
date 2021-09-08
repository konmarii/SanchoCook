class Producer::RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
    @recipe_detail = RecipeDetail.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to producer_product_path(product_id: @recipe.product_id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(:product_id, :name, :image, :introduction)
  end
end
