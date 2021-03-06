class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new
    @new_product = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :tagline)
  end
end
