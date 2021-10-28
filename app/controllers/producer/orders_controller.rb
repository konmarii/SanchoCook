class Producer::OrdersController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer

  def show
    @order = Order.find(params[:id])
    # ログインしている生産者に紐づく注文商品のみを表示
    @order_products = OrderProduct.joins(:product).where(products: { producer_id: current_producer.id }, order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to request.referer
    end
  end

  private

  def permitted_producer
    if !current_producer.is_permitted
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end
  
  def order_params
    params.require(:order).permit(:delivery_status)
  end
end
