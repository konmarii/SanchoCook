class Customer::SearchesController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  def search
    @range = params[:range]

    if @range == "Product"
      @products = Product.looks(params[:search], params[:word])
    else
      @recipes = Recipe.looks(params[:search], params[:word])
    end
  end
end
