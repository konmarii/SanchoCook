class Producer::ProducersController < ApplicationController
  before_action :authenticate_producer!

  def show
    @producer = Producer.find(current_producer.id)
    
    @order_products = OrderProduct.joins(:product).where(products: { producer_id: current_producer.id })
    
    # @daily_sales = []
    # (0..6).to_a.each do |day_count|
    #   time_data = day_count == 0 ? Time.zone.now : day_count.day.ago
    #   @order_products_per_day = @order_products.where(created_at: time_data.all_day)
    #   @order_products_per_day.each do |order_product_per_day|
    #     @daily_sales << order_product_per_day.tax_price.sum
    #   end
    # end
      
    # 週間売り上げ
    @order_products_6days_ago = @order_products.where(created_at: 6.day.ago.all_day)
    @sales_6days_ago = []
    @order_products_6days_ago.each do |order_product_6days_ago|
      @sales_6days_ago << order_product_6days_ago.tax_price
    end
    
    @order_products_5days_ago = @order_products.where(created_at: 5.day.ago.all_day)
    @sales_5days_ago = []
    @order_products_6days_ago.each do |order_product_5days_ago|
      @sales_5days_ago << order_product_5days_ago.tax_price
    end
    
    @order_products_4days_ago = @order_products.where(created_at: 4.day.ago.all_day)
    @sales_4days_ago = []
    @order_products_4days_ago.each do |order_product_4days_ago|
      @sales_4days_ago << order_product_4days_ago.tax_price
    end
    
    @order_products_3days_ago = @order_products.where(created_at: 3.day.ago.all_day)
    @sales_3days_ago = []
    @order_products_3days_ago.each do |order_product_3days_ago|
      @sales_3days_ago << order_product_3days_ago.tax_price
    end
    
    @order_products_2days_ago = @order_products.where(created_at: 2.day.ago.all_day)
    @sales_2days_ago = []
    @order_products_2days_ago.each do |order_product_2days_ago|
      @sales_2days_ago << order_product_2days_ago.tax_price
    end
    
    @order_products_1day_ago = @order_products.where(created_at: 1.day.ago.all_day)
    @sales_1day_ago = []
    @order_products_1day_ago.each do |order_product_1day_ago|
      @sales_1day_ago << order_product_1day_ago.tax_price
    end
    
    @order_products_today = @order_products.where(created_at: Time.zone.now.all_day)
    @sales_today = []
    @order_products_today.each do |order_product_today|
      @sales_today << order_product_today.tax_price
    end
    
    # 月間売り上げ
    @order_products_6months_ago = @order_products.where(created_at: 6.month.ago.all_month)
    @sales_6months_ago = []
    @order_products_6months_ago.each do |order_product_6months_ago|
      @sales_6months_ago << order_product_6months_ago.tax_price
    end
    
    @order_products_5months_ago = @order_products.where(created_at: 5.month.ago.all_month)
    @sales_5months_ago = []
    @order_products_5months_ago.each do |order_product_5months_ago|
      @sales_5months_ago << order_product_5months_ago.tax_price
    end
    
    @order_products_4months_ago = @order_products.where(created_at: 4.month.ago.all_month)
    @sales_4months_ago = []
    @order_products_4months_ago.each do |order_product_4months_ago|
      @sales_4months_ago << order_product_4months_ago.tax_price
    end
    
    @order_products_3months_ago = @order_products.where(created_at: 3.month.ago.all_month)
    @sales_3months_ago = []
    @order_products_3months_ago.each do |order_product_3months_ago|
      @sales_3months_ago << order_product_3months_ago.tax_price
    end
    
    @order_products_2months_ago = @order_products.where(created_at: 2.month.ago.all_month)
    @sales_2months_ago = []
    @order_products_2months_ago.each do |order_product_2months_ago|
      @sales_2months_ago << order_product_2months_ago.tax_price
    end
    
    @order_products_1month_ago = @order_products.where(created_at: 1.month.ago.all_month)
    @sales_1month_ago = []
    @order_products_1month_ago.each do |order_product_1month_ago|
      @sales_1month_ago << order_product_1month_ago.tax_price
    end
    
    @order_products_this_month = @order_products.where(created_at: Time.zone.now.all_month)
    @sales_this_month = []
    @order_products_this_month.each do |order_product_this_month|
      @sales_this_month << order_product_this_month.tax_price
    end
  end

  def edit
    @producer = Producer.find(current_producer.id)
  end

  def update
    @producer = Producer.find(current_producer.id)
    @producer.update(producer_params)
    redirect_to producer_my_page_path, success: "生産者情報を更新しました。"
  end

  def correct_producer
    @producer = Producer.find(params[:id])
    unless @producer.id == current_producer.id
      redirect_to producer_my_page_path
    end
  end

  private

  def producer_params
    params.require(:producer).permit(:company_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :image, :introduction, :email, :is_permitted)
  end
end
