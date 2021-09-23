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
end