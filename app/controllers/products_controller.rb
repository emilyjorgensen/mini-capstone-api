class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params["id"])
    render :show
  end

  def create
    @product = Product.create(
      supplier_id: params["supplier_id"],
      name: params["name"],
      price: params["price"],
      description: params["description"],
    )
    if @product.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @product.errors.full_messages }, status: unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      supplier_id: params[:supplier_id] || @product.supplier_id,
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
    )
    if @product.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @product.errors.full_messages }, status: unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product successfully deleted." }
  end
end
