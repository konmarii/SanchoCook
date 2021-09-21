class Customer::HomesController < ApplicationController
  
  def top
    @recipes = Recipe.all
    @products = Product.all
  end

  def about
  end
end
