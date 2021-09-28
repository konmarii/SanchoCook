module Producer::NotificationsHelper
  def unchecked_producer_notifications
    @producer_notifications = Notification.where(visited_producer_id: current_producer.id, checked: false)
  end
end
