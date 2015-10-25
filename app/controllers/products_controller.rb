class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_headers

  def index
    @products = Product.order('created_at')
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end


  def create
    @product = Product.create(product_params)
    if @product.save
      # render json: @product
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
      # return
    else
      render json: { success: false }
    end
  end

  private
    def product_params
      params.permit(:image, :name, :price,
        :dimensions, :height, :width, :category)
    end

    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
      headers['Access-Control-Max-Age'] = '86400'
    end
end
