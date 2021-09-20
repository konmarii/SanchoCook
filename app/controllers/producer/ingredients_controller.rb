class Producer::IngredientsController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @recipe = params[:id]
    if @ingredient.save
      redirect_to request.referer, success: "材料を登録しました。"
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
