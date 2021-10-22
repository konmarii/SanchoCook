class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer.id)
    @orders_pagination = @orders.page(params[:page]).per(5)
  end

  def new
    @order = Order.new
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if @cart_products.empty?
      redirect_to cart_products_path
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if params[:order][:address_option] == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @order.delivery_postal_code = params[:order][:delivery_postal_code]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]
    end
    if @order.delivery_postal_code.empty? || @order.delivery_address.empty? || @order.delivery_name.empty?
      redirect_to new_order_path
    end
  end

  def create
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if @order = Order.create(order_params)
      @cart_products.each do |cart_product|
        OrderProduct.create(
          order_id: @order.id,
          product_id: cart_product.product_id,
          tax_price: cart_product.product.include_tax,
          amount: cart_product.amount,
          harvest_status: 0
        )
      end
      render :thanks
      @customer = current_customer
      if @order.payment_method == 0
        ContactMailer.thanks_mail(@customer, @order).deliver
      else
        ContactMailer.bank_transfer_mail(@customer, @order).deliver
      end
      cart_products = CartProduct.where(customer_id: current_customer.id)
      cart_products.destroy_all
    end
  end

  def thanks
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: params[:id])
  end

  def pay
    @order = Order.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order.tatal_payment,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :delivery_postal_code, :delivery_address, :delivery_name, :delivery_fee, :total_payment, :order_status, :delivery_status, :payment_method)
  end
end
