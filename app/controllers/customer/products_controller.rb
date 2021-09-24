class Customer::ProductsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  
  def index
    @products = Product.where(sales_status:true)
    @products = Product.page(params[:page]).per(9)
  end

  def show
    @cart_product = CartProduct.new
    @product = Product.find(params[:id])
    @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    @recipes =  Recipe.where(product_id: @product.id)
    @producer = @product.producer
    @favorite_product = FavoriteProduct.where(customer_id: current_customer.id, product_id: @product.id)
  end
end
