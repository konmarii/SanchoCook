class Producer::OrderDetailsController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end
  
  def update
    @order_product = OrderProduct.find(params[:id])
    if @order_product.update(order_product_params)
      redirect_to request.referer 
    end
  end
  
  private
  def order_product_params
    params.require(:order_product).permit(:harvest_status)
  end
end
