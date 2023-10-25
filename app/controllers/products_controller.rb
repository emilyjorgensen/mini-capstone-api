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
      name: "peppermint tea",
      price: 6,
      image_url: nil,
      description: "A cozy tea for a cozy book!",
    )
    render :show
  end
end
