class User::TopController < ApplicationController
  def index
    @products = Product.all
  end
end
