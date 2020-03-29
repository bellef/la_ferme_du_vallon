class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create edit update destroy]
  before_action :load_product, only: %i[edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash.notice = I18n.t('.create.success')
      redirect_to products_path
    else
      flash.alert = I18n.t('.create.failure', message: @product.errors.full_messages.join(', '))
      render :new
    end
  end

  def edit; end

  def update
    @product.assign_attributes(product_params)

    if @product.save
      flash.notice = I18n.t('.update.success')
      redirect_to products_path
    else
      flash.alert = I18n.t('.update.failure', message: @product.errors.full_messages.join(', '))
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash.notice = I18n.t('.destroy.success')
      redirect_to products_path
    else
      flash.alert = I18n.t('.destroy.failure', message: @product.errors.full_messages.join(', '))
      redirect_to products_path
    end
  end

  private

    def load_product
      @product = Product.find(params[:id])
    end

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
