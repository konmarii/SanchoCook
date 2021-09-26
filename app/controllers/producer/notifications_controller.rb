class Producer::NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(visited_producer_id: current_producer.id)
  end
  
  def update
    notification = Notification.find(params[:id])
    if notification.update(checked: true)
      redirect_to action: :index
    end
  end
end
