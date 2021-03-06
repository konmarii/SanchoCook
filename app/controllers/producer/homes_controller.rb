class Producer::HomesController < ApplicationController
  before_action :authenticate_producer!

  def top
    # ログインしている生産者の出品した商品に関連する注文のみを表示
    @orders = Order.joins(order_products: :product).where(products: { producer_id: current_producer.id })
    @orders_pagination = @orders.page(params[:page]).per(10)
  end
end
