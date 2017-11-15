class ProductsController < ApplicationController

  def product_method
    product = Product.all
    render json: product.as_json
  end

  def product_first_method
    product = Product.first
    render json: product.as_json
  end
end
