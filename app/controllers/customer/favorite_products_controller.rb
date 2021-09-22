class Customer::FavoriteProductsController < ApplicationController
    
  def create
    @product = Product.find(params[:product_id])
    @favorite_product = current_customer.favorite_products.new(product_id: @product.id)
    @favorite_product.save
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    favorite_product = current_customer.favorite_products.find_by(product_id: @product.id)
    favorite_product.destroy
  end
end
