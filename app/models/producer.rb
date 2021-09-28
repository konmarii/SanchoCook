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
  
  validates :company_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :introduction, presence: true
end
