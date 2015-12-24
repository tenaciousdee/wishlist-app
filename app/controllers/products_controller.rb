class ProductsController < ApplicationController
  def index
    @products = Unirest.get("http://api.shopstyle.com/api/v2/products?pid=uid9904-31996852-79&limit=30").body
  end

  def new
    # @product = Product.new
  end

  def create
    # @product = Product.create(
    #   name: params[:name],
    #   description: params[:description],
    #   price: params[:price],
    #   image: params[:image]
    #   )

    # flash[:success] = "Product was successfully created"
    # redirect_to action: "index"
  end

  def show
    @product = Unirest.get("http://api.shopstyle.com/api/v2/products/#{params[:id]}?pid=uid9904-31996852-79").body
  end

  def edit
    # @product = Product.find_by(id: params[:id])
  end

  def update
    # @product = Product.find_by(id: params[:id])
    # @product.update(
    #   name: params[:name],
    #   description: params[:description],
    #   price: params[:price],
    #   image: params[:image]
    #   )

    # redirect_to action: "show"
  end

  def destroy
    # @product = Product.find_by(id: params[:id])
    # @product.destroy

    # redirect_to action: "index"
  end
end
