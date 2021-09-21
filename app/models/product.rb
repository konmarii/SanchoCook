class Product < ApplicationRecord

  attachment :image

  belongs_to :producer
  has_many :customers, through: :cart_products
  has_many :orders, through: :order_products
  has_many :cart_products
  has_many :order_products
  has_many :recipes
  has_many :favorites
  
  def favorited_by?(current_customer)
    favorites.where(customer_id: current_customer.id).exists?
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
