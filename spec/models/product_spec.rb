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
  describe '#title' do
    it 'should be presence' do
      should validate_presence_of(:title)
    end
  end
end