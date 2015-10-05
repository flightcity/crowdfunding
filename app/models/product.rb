class Product < ActiveRecord::Base
  has_many :product_images
  has_many :investments
  validates :title, presence: true
end
