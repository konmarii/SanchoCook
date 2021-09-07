class Product < ApplicationRecord

  #enum sales_status: {on_sale: :true, stop_sale: :false}

  attachment :image

  has_many :customers, through: :cart_products

  has_many :order_products
  has_many :orders, through: :order_products


  def include_tax
    self.tax_excluded_price*1.10
  end
end
