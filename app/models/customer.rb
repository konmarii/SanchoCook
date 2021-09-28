class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :cart_products

  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :favorite_products, dependent: :destroy
  has_many :favorite_recipes, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy

  has_many :active_customer_notifications, class_name: 'Notification', foreign_key: 'visitor_customer_id', dependent: :destroy
  has_many :passive_customer_notifications, class_name: 'Notification', foreign_key: 'visited_customer_id', dependent: :destroy
  
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  def active_for_authentication?
    super && self.is_deleted == false
  end
end
