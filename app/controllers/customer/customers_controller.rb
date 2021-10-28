class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer, only: [:edit, :unsubscribe]
  before_action :set_customer

  def show
  end

  def edit
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to my_page_path, success: "会員情報を更新しました。"
  end

  def unsubscribe
  end

  def withdraw
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, success: "退会しました。ありがとうございました。"
  end

  private
  def correct_customer
    @customer = Customer.find(params[:id])
    unless @customer.id == current_customer.id
     redirect_to customer_path
    end
  end
  
  def set_customer
    @customer = Customer.find(current_customer.id)
  end
  
  def customer_params
    params.require(:customer).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end
end
