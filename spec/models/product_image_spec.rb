require 'rails_helper'

RSpec.describe ProductImage, :type => :model do
  it "is valid with product_id, title, image_uid and image_name" do
    product_image = ProductImage.new(
      product_id: 1,
      title: 'title',
      image_uid: 'image_uid',
      image_name: 'image_name'
    )
    expect(product_image).to be_valid
  end
  it 'is invalid without a title' do
    product_image = ProductImage.new(title: nil)
    product_image.valid?
    expect(product_image.errors[:title]).to include("を入力してください。")
  end
  it 'is invalid without a product_id' do
    product_image = ProductImage.new(product_id: nil)
    product_image.valid?
    expect(product_image.errors[:product_id]).to include("を入力してください。")
  end
end
