class Customer::ProductsController < ApplicationController
  def index
    @products = Product.where(sales_status:true)
  end

  def show
    @cart_product = CartProduct.new
    @product = Product.find(params[:id])
    @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    @recipes =  Recipe.where(product_id: @product.id)
    @producer = @product.producer
  end
end
