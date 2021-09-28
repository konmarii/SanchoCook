class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image

  has_many :products, dependent: :destroy

  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :active_producer_notifications, class_name: 'Notification', foreign_key: 'visitor_producer_id', dependent: :destroy
  has_many :passive_producer_notifications, class_name: 'Notification', foreign_key: 'visited_producer_id', dependent: :destroy
end
