class Admin::ProductImagesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def show
    product = Product.find(params[:product_id])
    redirect_to [ :edit, :admin, product ]
  end

  def new
    @product = Product.find(params[:product_id])
    @product_image = ProductImage.new
  end

  def edit
    @product_image = ProductImage.find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    if @product.product_images.create(product_image_params)
      flash.notice = I18n.t('messages.product_image_created')
      redirect_to :admin_product_product_images
    else
      render action: 'new'
    end
  end

  def update
    @product_image = ProductImage.find(params[:id])
    @product_image.assign_attributes(product_image_params)
    if @product_image.save
      flash.notice = I18n.t('messages.product_image_edited')
      redirect_to admin_product_product_images_path(:product_id => @product_image.product_id)
    else
      render action: 'edit'
    end
  end

  def destroy
    product_image = ProductImage.find(params[:id])
    product_image.destroy!
    flash.notice = I18n.t('messages.product_image_deleted')
    redirect_to admin_product_product_images_path(:product_id => product_image.product_id)
  end

  private

  def product_image_params
    params.require(:product_image).permit(
    :title, :image
    )
  end
end
