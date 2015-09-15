class Investment < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :product_id, presence: true
  validates :user_id, presence: true

  after_save :update_product_price
  
  def update_product_price
    product = Product.find(self.product_id)
    product.current_price = product.investments.sum(:price)
    product.save
  end
end
