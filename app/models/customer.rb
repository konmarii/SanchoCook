class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :cart_products
  
  has_many :entries
  has_many :rooms, through: :entries
  has_many :messages
  has_many :favorite_products
  has_many :favorite_recipes
  has_many :recipe_comments
  
  has_many :active_customer_notifications, class_name: 'Notification', foreign_key: 'visitor_customer_id', dependent: :destroy
  has_many :passive_customer_notifications, class_name: 'Notification', foreign_key: 'visited_customer_id', dependent: :destroy
end