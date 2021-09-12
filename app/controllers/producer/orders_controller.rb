class Producer::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # ログインしている生産者に紐づく注文商品のみを表示
    @order_products = OrderProduct.joins(:product).where(products: {producer_id: current_producer.id}, order_id: @order.id)
  end

  def update
  end
end
