class Investment < ActiveRecord::Base
  belongs_to :product
  validates :product_id, presence: true
  belongs_to :user
  validates :user_id, presence: true
end
