class Producer::RecipesController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end
  
  def index
    @recipes = Recipe.joins(:product).where(products: {producer_id: current_producer.id})
    @recipes = Recipe.page(params[:page]).per(9)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
    @recipe_details = RecipeDetail.where(recipe_id: @recipe.id)
    @favorites = FavoriteRecipe.where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
    @products = Product.where(producer_id: current_producer.id)
  end

  def edit_recipe_detail
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new
    @recipe_detail = RecipeDetail.new
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
    @recipe_details = RecipeDetail.where(recipe_id: @recipe.id)
  end
  
  
  def edit_recipe_introduction
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
      redirect_to producer_edit_recipe_detail_path(@recipe.id)
    else
      redirect_to root_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to producer_recipes_path, success: "レシピを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to producer_recipes_path
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:product_id, :name, :image, :introduction)
  end
end
