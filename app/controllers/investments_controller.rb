class InvestmentsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @investment = Investment.new
  end


  def create
    @product = Product.find(params[:product_id])
    @investment = @product.investments.build(investment_params)
    @investment.user = current_user
    if @investment.save
      redirect_to :products, notice: I18n.t('messages.investment.created')
    else
      render action: 'new'
    end
  end

  private

  def investment_params
    params.require(:investment).permit(
    :price, :comment
    )
  end
end
