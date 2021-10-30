class Customer::ProductsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    @products = Product.where(sales_status: true)
    @products_pagination = @products.page(params[:page]).per(9)
  end

  def show
    @cart_product = CartProduct.new
    @product = Product.find(params[:id])
    @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    @recipes =  Recipe.where(product_id: @product.id)
    @producer = @product.producer
    @favorite_product = FavoriteProduct.where(customer_id: current_customer.id, product_id: @product.id)
    
    rooms = current_customer.entries.pluck(:room_id)
    entry = Entry.find_by(producer_id: @producer.id, room_id: rooms)
    # もしentryしたことあるなら
    unless entry.nil?
      # @roomに上記entryのroomを代入
      @room = entry.room
    else
      # それ以外は新しくroomを作り、
      @room = Room.new
      @room.save
      # entryを会員分と生産者で作る
      Entry.create(customer_id: current_customer.id, producer_id: @producer.id, room_id: @room.id)
    end
  end
end
