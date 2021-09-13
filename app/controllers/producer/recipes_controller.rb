class Producer::RecipesController < ApplicationController
  def index
    @recipes = Recipe.joins(:product).where(products: {producer_id: current_producer.id})
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
    @recipe_details = RecipeDetail.where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
    @products = Product.where(producer_id: current_producer.id)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
    @recipe_detail = RecipeDetail.new
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
    @recipe_details = RecipeDetail.where(recipe_id: @recipe.id)
  end

  def create
    @product = Product.find(params[:recipe][:product_id])
    @recipe = Recipe.new(recipe_params)
    @recipe.product_id = @product.id
    if @recipe.save
      redirect_to edit_producer_recipe_path(@recipe.id)
    else
      redirect_to root_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to producer_recipes_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(:product_id, :name, :image, :introduction)
  end
end
