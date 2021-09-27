class Customer::RecipeCommentsController < ApplicationController
  before_action :authenticate_customer!

  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_comments = RecipeComment.where(recipe_id: @recipe.id)
    @recipe_comment = RecipeComment.new(recipe_comment_params)
    @recipe_comment.customer_id = current_customer.id
    @recipe_comment.recipe_id = @recipe.id
    @recipe_comment.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_comment = RecipeComment.find(params[:id])
    @recipe_comment.destroy
  end
  
  private
  def recipe_comment_params
    params.require(:recipe_comment).permit(:customer_id, :recipe_id, :comment)
  end
end
