class Producer::RecipeDetailsController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer

  def permitted_producer
    if current_producer.is_permitted != true
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end

  def create
    @recipe_detail = RecipeDetail.new(recipe_detail_params)
    @recipe = params[:id]
    if @recipe_detail.save
      redirect_to request.referer, success: "作り方を登録しました。"
    else
      render :edit
    end
  end

  def destroy
    @recipe_detail = RecipeDetail.find(params[:id])
    if @recipe_detail.destroy
      redirect_to request.referer
    end
  end

  private

  def recipe_detail_params
    params.require(:recipe_detail).permit(:recipe_id, :image, :explanation)
  end
end
