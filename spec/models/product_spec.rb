require 'rails_helper'

RSpec.describe Product, :type => :model do
  it "is valid with title, target_price, current_price, start_datetime and end_datetime" do
    product = Product.new(
      title: 'title',
      target_price: 'target_price',
      current_price: 'current_price',
      start_datetime: 'start_datetime',
      end_datetime: 'end_datetime'
    )
    expect(product).to be_valid
  end
  it 'is invalid without a title' do
    product = Product.new(title: nil)
    product.valid?
    expect(product.errors[:title]).to include("を入力してください。")
  end
end