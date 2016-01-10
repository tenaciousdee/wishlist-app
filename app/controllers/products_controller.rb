class ProductsController < ApplicationController
  def index
    client = Shopsense::API.new('partner_id' => 'uid9904-31996852-79')
    response = client.search("new", index = 0, num_results = 15)

    if params[:start]
      response = client.search("new", index = params[:start], num_results = 15)
    end

    raw_products = JSON.parse(response)["products"]

    @products = raw_products.map do |product|
      product = OpenStruct.new(product)
      image = product.images.find { |i| i["sizeName"] == 'Original' }
      product.image = OpenStruct.new(image)
      product
    end

    @lists = List.all
  end

  def new
  end

  def create
    product_id = params[:product_id]
    product_data = Unirest.get("http://api.shopstyle.com/api/v2/products/#{params[:product_id]}?pid=uid9904-31996852-79").body
    Product.create(
      shopstyle_id: product_data["id"],
      name: product_data["name"],
      image_src: product_data["image"]["sizes"]["Original"]["url"],
      list_id: params[:list][:list_id]
      )
    flash[:success] = "Product was successfully added to list"
    redirect_to "/lists/#{params[:list][:list_id]}"
  end

  def show
    @product = Unirest.get("http://api.shopstyle.com/api/v2/products/#{params[:id]}?pid=uid9904-31996852-79").body
  end

  def edit
  end

  def update
  end

  def destroy
<<<<<<< HEAD
    product_id = params[:id]
=======
    product_id = params[:product_id]
>>>>>>> b7873ddcb72746188747cd97856c408331e464b6
    @product = Product.find_by(id: product_id)
    @product.destroy

    redirect_to action: "index"
    flash[:success] = "Product was successfully removed from list"
  end

  def search
    if params[:input_search]
      client = Shopsense::API.new({'partner_id' => 'uid9904-31996852-79'})
      response = client.search(params[:input_search], index = 0, num_results = 50)
      raw_products = JSON.parse(response)["products"]
      puts raw_products.inspect

      @products = raw_products.map do |product|
        product = OpenStruct.new(product)
        image = product.images.find { |i| i["sizeName"] == 'Original' }
        product.image = OpenStruct.new(image)
        product
      end
      @search = params[:input_search]
      if params[:start]
        result = client.search(params[:input_search], index = params[:start])
      end
    end

    @lists = List.all

    render :index
  end
end
