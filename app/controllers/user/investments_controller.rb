class User::InvestmentsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @investment = Investment.new
  end


  def create
    @product = Product.find(params[:product_id])
    if @product.investments.create(investment_params)
      flash.notice = I18n.t('messages.investment.created')
      redirect_to :user_root
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
