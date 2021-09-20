class Producer::OrderDetailsController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer
  
  def permitted_producer
    if current_producer.is_permitted != true 
      flash[:notice]="権限がありません"
      redirect_to producer_root_path
    end
  end
  
  def update
  end
end
