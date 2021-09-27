class Product < ApplicationRecord

  attachment :image

  belongs_to :producer
  has_many :customers, through: :cart_products
  has_many :orders, through: :order_products
  has_many :cart_products
  has_many :order_products
  has_many :recipes
  has_many :favorite_products
  
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :tax_excluded_price, presence: true
  validates :sales_status, presence: true
  
  def favorited_by?(current_customer)
    favorite_products.where(customer_id: current_customer.id).exists?
  end

  def include_tax
    self.tax_excluded_price*1.10
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @product = Product.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @product = Product.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @product = Product.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @product = Product.where("name LIKE?","%#{word}%")
    else
      @product = Product.all
    end
  end

end
