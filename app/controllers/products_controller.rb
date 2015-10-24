class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.order('created_at')
  end

  def new
    @product = Product.new
  end


  def create
    @product = Product.create(product_params)
    if @product.save
      render json: @product
    else
      render json: { success: false}
    end
  end

  private
    def product_params
      params.permit(:image, :name, :price, :image_link,
        :dimensions, :height, :width)
    end
end
