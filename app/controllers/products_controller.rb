class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image]
      )

    flash[:success] = "Product was successfully created"
    redirect_to action: "index"
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image]
      )

    redirect_to action: "show"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    redirect_to action: "index"
  end
end
