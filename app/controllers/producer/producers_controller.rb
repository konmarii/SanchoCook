class Producer::ProducersController < ApplicationController
  before_action :authenticate_producer!
  def show
    @producer = Producer.find(current_producer.id)
  end

  def edit
    @producer = Producer.find(current_producer.id)
  end

  def update
    @producer = Producer.find(current_producer.id)
    @producer.update(producer_params)
    redirect_to producer_my_page_path
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
