class Admin::ProductsController < AdminController
  def index
    @products = Product.all
  end

  def show
    product = Product.find(params[:id])
    redirect_to [ :edit, :admin, product ]
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash.notice = I18n.t('messages.product.created')
      redirect_to :admin_products
    else
      render action: 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.assign_attributes(product_params)
    if @product.save
      flash.notice = I18n.t('messages.product.edited')
      redirect_to :admin_products
    else
      render action: 'edit'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!
    flash.notice = I18n.t('messages.product.deleted')
    redirect_to :admin_products
  end

  private
  def product_params
    params.require(:product).permit(
      :title, :body, :target_price, :current_price, :start_datetime, :end_datetime
    )
  end
end
