require 'rails_helper'

RSpec.describe Investment, :type => :model do
  it "is valid with product_id, user_id, price and comment" do
    investment = Investment.new(
      product_id: 1,
      user_id: 1,
      price: 1,
      comment: 'comment'
    )
    expect(investment).to be_valid
  end
  it 'is invalid without a product_id' do
    investment = Investment.new(product_id: nil)
    investment.valid?
    expect(investment.errors[:product_id]).to include("を入力してください。")
  end
  it 'is invalid without a user_id' do
    investment = Investment.new(user_id: nil)
    investment.valid?
    expect(investment.errors[:user_id]).to include("を入力してください。")
  end
end
