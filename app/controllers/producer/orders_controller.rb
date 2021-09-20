class Producer::OrdersController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      flash[:notice]="権限がありません"
      redirect_to producer_root_path
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
