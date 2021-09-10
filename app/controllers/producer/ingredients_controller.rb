class Producer::IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @recipe = params[:id]
    if @ingredient.save
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
  def ingredient_params
    params.require(:ingredient).permit(:recipe_id, :name, :amount, :unit)
  end
end
