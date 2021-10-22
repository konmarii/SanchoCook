class Producer::NotificationsController < ApplicationController
  before_action :authenticate_producer!
  before_action :permitted_producer

  def permitted_producer
    if current_producer.is_permitted != true
      redirect_to producer_root_path, info: "権限がありません。管理者からの承認をお待ちください。"
    end
  end

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
