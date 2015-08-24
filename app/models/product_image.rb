class ProductImage < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :product
  validates :product_id, presence: true
  validates :title, presence: true
end
