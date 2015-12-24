class ProductsController < ApplicationController
  def index
    client = Shopsense::API.new('partner_id' => 'uid9904-31996852-79')
    response = client.search("women", index = 0, num_results = 50)

    raw_products = JSON.parse(response)["products"]

    @products = raw_products.map do |product|
      product = OpenStruct.new(product)
      image = product.images.find { |i| i["sizeName"] == 'Original' }
      product.image = OpenStruct.new(image)
      product
    end

  def new
  end

  def create
  end

  def show
    @product = Unirest.get("http://api.shopstyle.com/api/v2/products/#{params[:id]}?pid=uid9904-31996852-79").body
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    if params[:input_search]
      client = Shopsense::API.new({'partner_id' => 'uid9904-31996852-79'})
      response = client.search(params[:input_search])
      raw_products = JSON.parse(response)["products"]
      puts raw_products.inspect

      @products = raw_products.map do |product|
      product = OpenStruct.new(product)
      image = product.images.find { |i| i["sizeName"] == 'Original' }
      product.image = OpenStruct.new(image)
      product
    end
      @search = params[:input_search]
    end

    render :index
  end
end
end
