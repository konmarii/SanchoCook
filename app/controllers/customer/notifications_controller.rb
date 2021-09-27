class Customer::NotificationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @notifications = Notification.where(visited_customer_id: current_customer.id)
  end
  
  def update
    notification = Notification.find(params[:id])
    if notification.update(checked: true)
      redirect_to action: :index
    end
  end
end
