class Customer::ProducersController < ApplicationController
  def show
    @producer = Producer.find(params[:id])
    @products = Product.where(producer_id: @producer.id)
  end
end
