class Producer::ProductsController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      flash[:notice]="権限がありません"
      redirect_to producer_root_path
    end
  end
  
  def index
    @products = Product.where(producer_id: current_producer.id)
  end

  def show
    @product = Product.find(params[:id])
    @recipes = Recipe.where(product_id: @product.id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.producer_id = current_producer.id
    if @product.save
      redirect_to producer_product_path(@product.id)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to producer_product_path(@product.id)
    else
     render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to  producer_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :introduction, :image, :tax_excluded_price, :sales_status)
  end
end
