class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.assign_attributes(product_params)

    if @product.save
      flash.notice = "Yay"
      redirect_to products_path
    else
      flash.alert = "Nope"
      render :edit
    end
  end

  private

    def product_params
      params.require(:product).
            permit(
              :title,
              :description,
              :price,
              :packaging,
              :picture
            )
    end
end
