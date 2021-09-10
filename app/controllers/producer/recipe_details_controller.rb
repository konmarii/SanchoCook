class Producer::RecipeDetailsController < ApplicationController
  def create
    @recipe_detail = RecipeDetail.new(recipe_detail_params)
    @recipe = params[:id]
    if @recipe_detail.save
      redirect_to request.referer
    else
      render :edit
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def recipe_detail_params
    params.require(:recipe_detail).permit(:recipe_id, :image, :explanation)
  end
end
