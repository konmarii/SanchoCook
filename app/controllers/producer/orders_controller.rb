class Producer::OrdersController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end
  
  def show
    @order = Order.find(params[:id])
    # ログインしている生産者に紐づく注文商品のみを表示
    @order_products = OrderProduct.joins(:product).where(products: {producer_id: current_producer.id}, order_id: @order.id)
  end

  def update
  end
end
