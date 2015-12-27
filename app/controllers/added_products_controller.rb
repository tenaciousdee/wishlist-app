class AddedProductsController < ApplicationController
  def create
    added_product = Unirest.post(
      "http://api.shopstyle.com/api/v2/products?pid=uid9904-31996852-79",
      headers: {"Accept" => "application/json"},
      parameters: {
        product_id: params[:product_id],
        product_name: params[:product_name],
        status: "added"
      }
      ).body

    flash[:success] = "Product was successfully added to your Wish List"
    redirect_to "/lists/#{@list.id}"
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
