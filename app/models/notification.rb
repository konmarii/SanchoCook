class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  belongs_to :room, optional: true
  belongs_to :message, optional: true

  belongs_to :visitor_customer, class_name: 'Customer', foreign_key: 'visitor_customer_id', optional: true
  belongs_to :visited_producer, class_name: 'Producer', foreign_key: 'visited_producer_id', optional: true
  belongs_to :visitor_producer, class_name: 'Producer', foreign_key: 'visitor_producer_id', optional: true
  belongs_to :visited_customer, class_name: 'Customer', foreign_key: 'visited_customer_id', optional: true

  def unchecked_customer_notifications
    @customer_notifications = Notification.where(visited_customer_id: current_customer.id, checked: false)
  end

  def unchecked_producer_notifications
    @producer_notifications = current_producer.passive_notifications.where(checked: false)
  end
end
