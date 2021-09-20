class Producer::RecipeDetailsController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      flash[:notice]="権限がありません"
      redirect_to producer_root_path
    end
  end
  

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
