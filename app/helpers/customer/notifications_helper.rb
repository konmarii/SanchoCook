module Customer::NotificationsHelper
  def unchecked_customer_notifications
    @customer_notifications = Notification.where(visited_customer_id: current_customer.id, checked: false)
  end
end
