class CartedProductsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    if @carted_product.valid? #happy path
      render json: { message: "product(s) added to cart" }
    else #sad path
      render json: { errors: @carted_product.errors.full_messages }, status: unprocessable_entity
    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products != []
      render :index
    else
      render json: { message: "there are no products in your cart" }
    end
  end
end
