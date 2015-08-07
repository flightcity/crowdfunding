class ProductImage < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :product
end
