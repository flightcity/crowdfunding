class Product < ActiveRecord::Base
  has_many :product_images
  validates :title, presence: true
end
