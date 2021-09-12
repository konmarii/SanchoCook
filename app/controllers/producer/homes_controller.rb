class Producer::HomesController < ApplicationController
  def top
    # ログインしている生産者の出品した商品に関連する注文のみを表示
    @orders = Order.joins(order_products: :product).where(products: {producer_id: current_producer.id})
  end
end
