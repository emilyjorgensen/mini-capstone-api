class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.create(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id],
    )
    if @carted_product.valid? #happy path
      render json: { message: "product(s) added to cart" }
    else #sad path
      render json: { errors: @carted_product.errors.full_messages }, status: unprocessable_entity
    end
  end
end
