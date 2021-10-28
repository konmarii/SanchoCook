class Producer::ProducersController < ApplicationController
  before_action :authenticate_producer!

  def show
    @producer = Producer.find(current_producer.id)
    
    @order_products = OrderProduct.joins(:product).where(products: { producer_id: current_producer.id })
    # {0 => [], 1 => [], 2 => []}
    # [[], [], [], [], []]
    # @sales_some_days = (0..6).to_a.map do |day_number|
    #   # do something
    #   time_data = day_number == 0 ? Time.zone.now : day_number.day.ago
    #   order_prodcts = @order_products.where(created_at: time_data.all_day)
    #   order_prodcts.blank? ? [] : order_prodcts.map(&:tax_price)
    # end
    
  # @sales_some_days = []
    # (0..6).to_a.each do |day_number|
    #   time_data = day_number == 0 ? Time.zone.now : day_number.day.ago
    #   order_prodcts = @order_products.where(created_at: time_data.all_day)
    #   @sales_some_days << order_prodcts.map(&:tax_price)
    # end
    
    # (0..6).to_a.each do |day_number|
    #   # implement me!
    # end
    
    # @sales_some_days.each_with_index do |index, day_array|
    # # index => 0, 1, 2....
    #  day_array.each do |day|
    #    day.do_something!
    #  end
    # end
    
    # @sales_some_days_hash.each do |key, value|
    # # key => 0
    # # value => []
    # end
    
    @order_products = OrderProduct.joins(:product).where(products: { producer_id: current_producer.id })
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
    
    
  # # 6日前のデータを取得
  # @weekly = []
  # for (0..7).each do |i|
  #   if i == 0
  #     products_before_i_days = @order_products.where(created_at: Time.zone.now.all_day)
  #   else
  #     products_before_i_days = @order_products.where(created_at: i.day.ago.all_day)
  #   end
  #   products_before_i_days.map { |before| @weekly << before.tax_price}
    
    
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
