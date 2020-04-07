class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create edit update destroy]
  before_action :load_product, only: %i[edit update destroy]

  I18N_SUBJECT = Product.model_name.human

  def index
    @products = Product.all.includes(:categories)
    # Load categories for navbar
    @categories = Category.all

    if params[:category_id].present?
      @products = @products.with_category(params[:category_id])
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash.notice = I18n.t('actions.create.success', subject: I18N_SUBJECT)
      redirect_to products_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @product.assign_attributes(product_params)

    if @product.save
      flash.notice = I18n.t('actions.update.success', subject: I18N_SUBJECT)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash.notice = I18n.t('actions.destroy.success', subject: I18N_SUBJECT)
      redirect_to products_path
    else
      flash.alert = I18n.t('actions.destroy.failure', message: @product.errors.full_messages.join(', '))
      redirect_to products_path
    end
  end

  private

    def load_product
      @product = Product.includes(:categories).find(params[:id])
    end

    def product_params
      params.require(:product).
            permit(
              :title,
              :description,
              :price,
              :packaging,
              :picture,
              category_ids: []
            )
    end
end
